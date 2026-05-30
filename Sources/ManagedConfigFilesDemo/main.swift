import Darwin
import Foundation
import ManagedConfigurationFilesShim

private struct DemoAppConfiguration: Decodable {
    let name: String
    let whatToSay: String

    private enum CodingKeys: String, CodingKey {
        case name
        case whatToSay = "what_to_say"
    }
}

let serviceType = "com.example.demoapp"
let configFileName = "demoapp.conf"
let pathCapacity = Int(PATH_MAX)
var pathBuffer = [CChar](repeating: 0, count: pathCapacity)

let pathSize = serviceType.withCString { serviceTypePointer in
    managed_configuration_service_path_for_service_type(
        serviceTypePointer,
        &pathBuffer,
        pathBuffer.count
    )
}

if pathSize > 0 {
    let servicePath = pathBuffer.withUnsafeBufferPointer { buffer in
        String(cString: buffer.baseAddress!)
    }
    let configURL = URL(fileURLWithPath: servicePath, isDirectory: true)
        .appendingPathComponent(configFileName, isDirectory: false)

    do {
        let data = try Data(contentsOf: configURL)
        let configuration = try JSONDecoder().decode(DemoAppConfiguration.self, from: data)

        print("\(configuration.whatToSay) \(configuration.name)")
    } catch {
        fputs("failed to read managed config file \(configURL.path): \(error)\n", stderr)
        exit(EXIT_FAILURE)
    }
} else {
    let message = String(cString: strerror(errno))
    fputs("mcf_service_path_for_service_type failed for \(serviceType): \(message)\n", stderr)
    exit(EXIT_FAILURE)
}
