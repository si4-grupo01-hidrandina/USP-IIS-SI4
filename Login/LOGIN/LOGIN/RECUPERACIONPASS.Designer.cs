namespace LOGIN
{
    partial class RECUPERACIONPASS
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.BTN_RECUPERAR_PASS = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.TXTCORREO_ELECTRONICO = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // BTN_RECUPERAR_PASS
            // 
            this.BTN_RECUPERAR_PASS.Location = new System.Drawing.Point(200, 114);
            this.BTN_RECUPERAR_PASS.Name = "BTN_RECUPERAR_PASS";
            this.BTN_RECUPERAR_PASS.Size = new System.Drawing.Size(75, 23);
            this.BTN_RECUPERAR_PASS.TabIndex = 5;
            this.BTN_RECUPERAR_PASS.Text = "Recuperar";
            this.BTN_RECUPERAR_PASS.UseVisualStyleBackColor = true;
            this.BTN_RECUPERAR_PASS.Click += new System.EventHandler(this.btnRecuperarContrasena_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(45, 56);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(94, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Correo Electronico";
            // 
            // TXTCORREO_ELECTRONICO
            // 
            this.TXTCORREO_ELECTRONICO.Location = new System.Drawing.Point(171, 56);
            this.TXTCORREO_ELECTRONICO.Name = "TXTCORREO_ELECTRONICO";
            this.TXTCORREO_ELECTRONICO.Size = new System.Drawing.Size(291, 20);
            this.TXTCORREO_ELECTRONICO.TabIndex = 3;
            // 
            // RECUPERACIONPASS
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(509, 181);
            this.Controls.Add(this.BTN_RECUPERAR_PASS);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.TXTCORREO_ELECTRONICO);
            this.Name = "RECUPERACIONPASS";
            this.Text = "RECUPERACIONPASS";
            this.Load += new System.EventHandler(this.RECUPERACIONPASS_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button BTN_RECUPERAR_PASS;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox TXTCORREO_ELECTRONICO;
    }
}