//
//  ContentView.swift
//  E-Comm
//
//  Created by user265215 on 8/28/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    
    
    
    var body: some View {
        
        VStack {
            Text("Welcome to the App")
                .font(.largeTitle)
                .padding()
            
            NavigationSplitView {
                
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            Image(item.image)                        } label: {
                                Text("New \(item.name) added")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
               
            } detail: {
                Text("Select an item")
            }
        }
      
        
        ECommView()
            .frame(maxHeight: .infinity)
        
     
        
    }
        private func addItem() {
            withAnimation {
                let newItem = Item(name: "Image", image: "fn2", description: "New description", supplier: "New Supplier", price: 50)
                    modelContext.insert(newItem)
            }
        }
        
        private func deleteItems(offsets: IndexSet) {
            withAnimation {
                for index in offsets {
                    modelContext.delete(items[index])
                }
            }
        }
    }

    
    #Preview {
        ContentView()
            .modelContainer(for: Item.self, inMemory: true)
    }

