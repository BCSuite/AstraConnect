//
//  ACSolanaClusterNode.swift
//  AstraConnect
//
//  Created by scott on 2025/10/26.
//

import Foundation

/*
 {
       "featureSet": 3604001754,
       "gossip": "141.98.219.145:8001",
       "pubkey": "GRXV2qvD5NMY5i49pEngEHGp62oWwM1STfFyz6RtBfCj",
       "pubsub": null,
       "rpc": null,
       "serveRepair": "141.98.219.145:8013",
       "shredVersion": 29062,
       "tpu": "141.98.219.145:8004",
       "tpuForwards": "141.98.219.145:8005",
       "tpuForwardsQuic": "141.98.219.145:8011",
       "tpuQuic": "141.98.219.145:8010",
       "tpuVote": "141.98.219.145:8006",
       "tvu": "141.98.219.145:8002",
       "version": "3.0.6"
     }
 */
/// A model represent the information of a  Solana cluster node, details are shown as above.
/// The official doc is: https://solana.com/docs/rpc/http/getclusternodes.
public struct ACSolanaClusterNode: Codable, Sendable {
    
    /// The unique identifier of the node's feature set.
    public var featureSet: UInt32?
    
    /// Gossip network address for the node.
    public var gossip: String?
    
    /// Node public key, as base-58 encoded string.
    public var pubkey: String
    
    public var pubsub: ACDynamicCodation?
    
    /// JSON RPC network address for the node, or null if the JSON RPC service is not enabled.
    public var rpc: String?
    
    public var serveRepair: String?
    
    /// The shred version the node has been configured to use
    public var shredVersion: UInt16?
    
    /// TPU network address for the node.
    public var tpu: String?
    
    /// TPU network address forwards for the node.
    public var tpuForwards: String?
    
    /// TPU network address forwards quic.
    public var tpuForwardsQuic: String?
    
    /// TPU network address quic.
    public var tpuQuic: String?
    
    public var tpuVote: String?
    
    public var tvu: String?
    
    /// The software version of the node, or null if the version information is not available.
    public var version: String?
    
    public init(featureSet: UInt32? = nil,
                gossip: String? = nil,
                pubkey: String,
                pubsub: ACDynamicCodation? = nil,
                rpc: String? = nil,
                serveRepair: String? = nil,
                shredVersion: UInt16? = nil,
                tpu: String? = nil,
                tpuForwards: String? = nil,
                tpuForwardsQuic: String? = nil,
                tpuQuic: String? = nil,
                tpuVote: String? = nil,
                tvu: String? = nil,
                version: String? = nil) {
        self.featureSet = featureSet
        self.gossip = gossip
        self.pubkey = pubkey
        self.pubsub = pubsub
        self.rpc = rpc
        self.serveRepair = serveRepair
        self.shredVersion = shredVersion
        self.tpu = tpu
        self.tpuForwards = tpuForwards
        self.tpuForwardsQuic = tpuForwardsQuic
        self.tpuQuic = tpuQuic
        self.tpuVote = tpuVote
        self.tvu = tvu
        self.version = version
    }
}
