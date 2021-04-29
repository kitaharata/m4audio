using System;
using System.Windows.Forms;

namespace M4Audio
{
    public class Form1 : Form
    {
        private System.Windows.Media.MediaPlayer Player;
        Button n = new Button();
        Button m = new Button();
        bool l = false;
        
        public Form1()
        {
            FormBorderStyle = FormBorderStyle.FixedSingle;
            this.TopMost = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Width = 120;
            this.Height = 90;
            n.Text = "Play";;
            n.AutoSize = true;
            n.Width = this.Width - 6;
            m.Text = "Stop";
            m.AutoSize = true;
            m.Width = this.Width - 6;
            m.Top = n.Bottom;
            this.Controls.Add(n);
            this.Controls.Add(m);
            n.Click += new EventHandler(Click1);
            m.Click += new EventHandler(Click2);
        }
        
        void Click1(Object sender, EventArgs e)
        {
            if (Player == null)
            {
                Player = new System.Windows.Media.MediaPlayer();
                Player.Open(new System.Uri(System.IO.Path.GetFullPath(@"audio.m4a")));
                Player.Play();
                l = true;
                n.Text = "Pause";
            }
            else
            {
                if (l)
                {
                    Player.Pause();
                    l = false;
                    n.Text = "Play";
                }
                else
                {
                    Player.Play();
                    l = true;
                    n.Text = "Pause";
                }
            }
        }
        
        void Click2(Object sender, EventArgs e)
        {
            if (Player != null)
            {
                Player.Stop();
                Player.Close();
                Player = null;
                l = false;
                n.Text = "Play";
            }
        }
        
        [STAThread]
        static void Main()
        {
            Application.Run(new Form1());
        }
    }
}
