# PowerShell -ExecutionPolicy RemoteSigned -File Program.ps1

$ref = @(
    "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\System.Windows.Forms.dll"
    "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\WPF\PresentationCore.dll"
    "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\WPF\PresentationFramework.dll"
    "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\WPF\WindowsBase.dll"
)

$src = @"
using System;
using System.IO;
using System.Windows.Forms;
using System.Windows.Media;

namespace WindowsFormsApp
{
    public class Program : Form
    {
        public Program(string[] args)
        {
            this.TopMost = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Width = 120;
            this.Height = 90;

            MediaPlayer player = null;
            var isPlay = false;

            var playButton = new Button();
            playButton.Text = "Play";
            playButton.Width = this.Width - 20;
            playButton.Left = (this.Width / 2) - (playButton.Width / 2) - 8;
            playButton.Click += (sender, e) =>
            {
                if (player == null)
                {
                    player = new MediaPlayer();
                    if (args.Length == 0)
                        player.Open(new Uri(Path.GetFullPath("audio.m4a")));
                    else
                        player.Open(new Uri(Path.GetFullPath(args[0])));
                    player.Play();
                    isPlay = true;
                    playButton.Text = "Pause";
                }
                else
                {
                    if (isPlay)
                    {
                        player.Pause();
                        isPlay = false;
                        playButton.Text = "Play";
                    }
                    else
                    {
                        player.Play();
                        isPlay = true;
                        playButton.Text = "Pause";
                    }
                }
            };

            var stopButton = new Button();
            stopButton.Text = "Stop";
            stopButton.Width = this.Width - 20;
            stopButton.Top = playButton.Bottom;
            stopButton.Left = (this.Width / 2) - (stopButton.Width / 2) - 8;
            stopButton.Click += (sender, e) =>
            {
                if (player != null)
                {
                    player.Stop();
                    player.Close();
                    player = null;
                    isPlay = false;
                    playButton.Text = "Play";
                }
            };

            this.Controls.Add(playButton);
            this.Controls.Add(stopButton);
        }

        [STAThread]
        public static void Main(string[] args)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Program(args));
        }
    }
}
"@

Add-Type -TypeDefinition $src -ReferencedAssemblies $ref
if ($Args.Length -eq 0)
{
    [WindowsFormsApp.Program]::Main(@())
}
else
{
    [WindowsFormsApp.Program]::Main($Args[0])
}
