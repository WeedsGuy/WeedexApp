import SwiftUI

struct EULAView: View {
    // Simulated long EULA text
    let eulaText = """
    End User License Agreement (EULA)
    Last Updated: September 03,2024
    This End User License Agreement ("Agreement") is a legal agreement between you ("End User" or "You") and Weedex Lawn Care, the developer of the Weedex Lawn Care application ("App"). By downloading, installing, or using the App, You agree to be bound by the terms and conditions of this Agreement. If You do not agree to the terms of this Agreement, do not download, install, or use the App.
    1. License Grant
    Weedex Lawn Care grants You a limited, non-exclusive, non-transferable, non-sublicensable license to install and use the App for personal, non-commercial use on a compatible device that You own or control, subject to the terms and conditions of this Agreement.
    2. Restrictions
    You agree not to:
    Copy, modify, or create derivative works of the App.
    Reverse engineer, decompile, or disassemble the App.
    Rent, lease, lend, sell, redistribute, or sublicense the App.
    Use the App in any manner that violates any applicable laws or regulations.
    Remove, alter, or obscure any proprietary notices (including copyright and trademark notices) of Weedex Lawn Care or its licensors.
    
    3. Ownership
    The App and all associated intellectual property rights are the exclusive property of Weedex Lawn Care. This Agreement does not grant You any ownership rights in the App.
    4. Privacy
    By using the App, You agree that Weedex Lawn Care may collect and use technical data and related information in accordance with our Privacy Policy, which is incorporated into this Agreement by reference. The Privacy Policy can be accessed at [Privacy Policy URL].
    5. Termination
    This Agreement is effective until terminated by You or Weedex Lawn Care. Your rights under this Agreement will terminate automatically without notice from Weedex Lawn Care if You fail to comply with any term(s) of this Agreement. Upon termination, You must cease all use of the App and uninstall it from Your device(s).
    6. Disclaimer of Warranties
    The App is provided "as is" and "as available" without any warranties of any kind, whether express, implied, or statutory, including, but not limited to, the implied warranties of merchantability, fitness for a particular purpose, and non-infringement. Weedex Lawn Care does not warrant that the App will be uninterrupted or error-free, that defects will be corrected, or that the App is free of viruses or other harmful components.
    7. Limitation of Liability
    To the fullest extent permitted by law, Weedex Lawn Care shall not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use or inability to use the App, even if Weedex Lawn Care has been advised of the possibility of such damages.
    8. Governing Law
    This Agreement shall be governed by and construed in accordance with the laws of the State of Texas, without regard to its conflict of law principles. Any disputes arising under or in connection with this Agreement shall be subject to the exclusive jurisdiction of the courts located in Lewisville, Texas.
    9. Changes to this Agreement
    Weedex Lawn Care reserves the right to modify this Agreement at any time. Any changes will be effective upon posting the revised Agreement within the App or via other communication to You. Your continued use of the App following the posting of changes will constitute Your acceptance of such changes.
    10. Contact Information
    If You have any questions about this Agreement, You can contact us at:
    Weedex Lawn Care
    250 E Valley Ridge Boulevard, Suite 700, Lewisville, TX 75057
    [help@weedexlawn.com]
    [972-727-9207]
    """
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                // Scrollable EULA text
                ScrollView {
                    Text(eulaText)
                        .padding()
                        .font(.body)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // "Return" button that navigates to MainHubView
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Return")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.weeder)
                        .cornerRadius(10)
                })
            }
        }
    }
}
