//
//  SidebarView.swift
//  SimpleSidebarUI
//
//  Created by Léo Lesimple on 28/05/2023.
//
import SwiftUI

struct SidebarView: View {
    @State private var isSidebarOpen = false

    var body: some View {
        NavigationView {
            content
                .navigationViewStyle(DoubleColumnNavigationViewStyle())
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button(action: toggleSidebar, label: {
                            Image(systemName: "sidebar.left")
                        })
                        .keyboardShortcut("/", modifiers: .command)
                    }
                }
                .onAppear {
                    #if os(macOS)
                    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
                    #endif
                }
            ContentView()
        }
    }
    
    private var content: some View {
        List {
            Section() {
                NavigationLink(destination: ContentView()) {
                    Label("Découvrir", systemImage: "house")
                }
            }
            
            Section(header: Text("Intranet")) {
                NavigationLink(destination: NavettesFromView()) {
                    Label("Navettes", systemImage: "box.truck")
                }
                NavigationLink(destination: SAVFormView()) {
                    Label("SAV", systemImage: "wrench.adjustable")
                }
                NavigationLink(destination: PosesFormView()) {
                    Label("Poses", systemImage: "wrench.and.screwdriver")
                }
                NavigationLink(destination: SupplyFormView()) {
                    Label("Fournitures", systemImage: "paintbrush")
                }
                NavigationLink(destination: HolidayFormView()) {
                    Label("Congés", systemImage: "beach.umbrella")
                }
            }

            Section(header: Text("Intranet Manager")) {
                NavigationLink(destination: NavettesDashboardView()) {
                    Label("Navettes", systemImage: "box.truck")
                }
                NavigationLink(destination: ContentView()) {
                    Label("SAV", systemImage: "wrench.adjustable")
                }
                NavigationLink(destination: ContentView()) {
                    Label("Poses", systemImage: "wrench.and.screwdriver")
                }
                NavigationLink(destination: ContentView()) {
                    Label("Fournitures", systemImage: "paintbrush")
                }
                NavigationLink(destination: ContentView()) {
                    Label("Congés", systemImage: "beach.umbrella")
                }
                NavigationLink(destination: ContentView()) {
                    Label("Plans", systemImage: "map")
                }
            }

            Section(header: Text("Connect")) {
                NavigationLink(destination: ContentView()) {
                    Label("Mon Compte", systemImage: "person")
                }
                NavigationLink(destination: ContentView()) {
                    Label("Notifications", systemImage: "bell")
                }
                NavigationLink(destination: ContentView()) {
                    Label("Paramètres", systemImage: "gear")
                }
            }
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 0, idealWidth: 250, maxWidth: .infinity)
        .padding(.leading, 0)
    }

    private func toggleSidebar() {
        #if os(macOS)
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #else
        isSidebarOpen.toggle()
        #endif
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
