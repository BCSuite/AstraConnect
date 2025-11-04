##                   

[TOC]

## **AstraConnect**

AstraConnect is a universal blockchain RPC client designed for iOS applications, enabling seamless RPC interactions with major public blockchains. It offers extensive customization for data formats, encoding/decoding methods, communication protocols, and Request/Response structures, ensuring effortless extensibility to any blockchain network. With method-level access control, each RPC method can be independently configured for endpoint URL, data format, transmission method, and Request/Response schema. Solana is currently supported, with upcoming integration of EVM-compatible networks (including Base and BSC) and other leading blockchains.

![iOS 14+](https://img.shields.io/badge/iOS-14%2B-blue) ![Swift 5.3+](https://img.shields.io/badge/Swift-5.3%2B-orange?logo=swift)



## Installation



## Usage

Each blockchain has its own dedicated interactor, which exposes native interfaces for every RPC method. To invoke a specific RPC method, simply call the corresponding native interface. For Solana, the usage is as follows:

```
// Configuring RPC address.
let solDevnetAddr = "https://api.devnet.solana.com"
// Configuring any requester conforms to the ACRequestCapability protocol.
let requester: any ACRequestCapability = URLSessionRequester()
// Configuring any logger conforms to the ACLoggable protocol.
let logger: any ACLoggable = ACConsoleLogger()
// Building the Solana interactor.
let solInteractor = ACSolanaInteractor(rpcAddress: solDevnetAddr,
                                       requester: requester,
                                       logger: logger)
// Calling the 'getBalance' to get corresponding balance of the account of provided Pubkey.
let balance =  try? await solInteractor.getBalance(of: acctAddr,
                                                  optionalParams: ACSolanaBasicOptionalParams(commitment: .finalized,
                                                                                              minContextSlot: 10))
```

If want to configure a different RPC address for one  RPC method,  just setting the `rpcAddress` param like below:

```
let rpcAddress = "https://api.testnet.solana.com"
let balance =  try? await solInteractor.getBalance(of: acctAddr,
                                                   rpcAddress: rpcAddress)
```

If want to specify other data stream format for one  request,  just setting the `dataStreamParams.dataInfo` param like below:

```
let rpcAddress = "https://api.testnet.solana.com"
let dataInfo = CustomData()
let balance =  try? await solInteractor.getBalance(of: acctAddr,
                                                   rpcAddress: rpcAddress,
                                                   dataStreamParams: ACReqDSA(dataInfo: dataInfo))
```

Now AstraConnect only supports `JSON`,  it needs to customize other data stream format if want to use non-JSON data.



## Extention

AstraConnect supports customize serverval functionalities:

- **Request builder**:  supporting customizing any builders conforms to the  `ACURLRequestBuildable` protocol to build a request according to different RPC params constructions.

- **URLRequest builder**:  supporting customizing any URLRequest builder conforms to the `ACURLRequestBuildable`,  if using the `URLSession` to handle the network request, you can extend custom URLRequest builder according to corresponding specific needs.

- **Data stream format**:  supporting customizing any data format conforms to the  `ACRPCDataRepresentable `protocol, only supports  `JSON` now.

- **Encoder**:  supporting customizing any encoder conforms to the `ACEncodable` protocol.

- **Decoder**:  supporting customizing any decoder conforms to the `ACDecodable` protocol.

- **Requester**:  supporting customizing any requester, providing network interaction capability, conforms to the `ACDecodable` protocol. Now, the defult requester is `URLSessionRequester`  which internally uses `URLSession` to handle the network request.

- **Response**:  supporting customizing any response conforms to the `ACRPCResponsive` protocol. Even if different chains have respective responsive formats, you don't need to write encoding, parsing and processsing logic for each chain,  just defining the corresponding Response for each, the AstraConnect automatically handles those as one chain.

- **Logger**:  supporting customizing any logger conforms to the `ACLoggable` protocol, now the default logger is `ACConsoleLogger ` which just outputs to the console.

  

## Solana

Now, all RPC methods in the official doc: https://solana.com/docs/rpc/http have corresponding native interface.