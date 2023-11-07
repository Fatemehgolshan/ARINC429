using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;

namespace COM
{
    public partial class Form1 : Form
    {
        Thread rthread;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            string[] ports = SerialPort.GetPortNames();
            cboPort.Items.AddRange(ports);
        //    if(ports.Length != 0)
            cboPort.SelectedIndex = 0;
            btnClose.Enabled = false;

            serialPort1.Encoding = System.Text.Encoding.GetEncoding(28591);
        }

        private void btnOpen_Click(object sender, EventArgs e)
        {

            btnOpen.Enabled = false;
            btnClose.Enabled = true;
            try
            {
                serialPort1.PortName = cboPort.Text;
                serialPort1.Open();

                rthread = new Thread(new ThreadStart(receiverThread));
                rthread.Start();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                if (serialPort1.IsOpen)
                {
                    List<byte> buffer = new List<byte>();

                    String[] aa = txtMessage.Text.Split(' ');

                    foreach (String a in aa)
                    {
                        int value = Convert.ToInt32(a, 16);
                        byte v = (byte)value;
                        buffer.Add(v);
                    }

                    serialPort1.Write(buffer.ToArray(), 0, buffer.Count);
                    //serialPort1.Write(ret);
                    txtMessage.Clear();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            btnOpen.Enabled = true;
            btnClose.Enabled = false;
            try
            {
                serialPort1.Close();
                rthread.Abort();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnReceive_Click(object sender, EventArgs e)
        {
            /*try
            {
                if (serialPort1.IsOpen)
                {
                    txtReceive.Text = serialPort1.ReadExisting();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }*/
        }

        private void receiverThread()
        {
            string str = "";
            while (true)
            {
                str = receive();
                if (str != "")
                {
                    this.Invoke((MethodInvoker)delegate
                    {
                        txtReceive.Text = txtReceive.Text + str + "\r\n"; // runs on UI thread
                    });
                }
            }
        }

        private string getHex(string val)
        {
            string ret = "";
            foreach (char a in val)
            {
                string hex = BitConverter.ToString(new byte[] { Convert.ToByte(a) });
                ret = ret + hex + " ";
            }
            return ret;
        }

        private string receive()
        {
            try
            {
                if (serialPort1.IsOpen)
                {
                    string val = serialPort1.ReadExisting();
                    if (val != null)
                    {
                        return getHex(val);
                    }
                    else
                    {
                        return "";
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            return "";
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (serialPort1.IsOpen)
            {
                serialPort1.Close();
                rthread.Abort();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                String output = "BB";
                if (serialPort1.IsOpen)
                {
                    List<byte> buffer = new List<byte>();

                    String[] aa = output.Split(' ');

                    foreach (String a in aa)
                    {
                        int value = Convert.ToInt32(a, 16);
                        byte v = (byte)value;
                        buffer.Add(v);
                    }

                    serialPort1.Write(buffer.ToArray(), 0, buffer.Count);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void txtMessage_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnControl_Reg_Click(object sender, EventArgs e)
        {
            try
            {
                String output = "CC 80";
                if (serialPort1.IsOpen)
                {
                    List<byte> buffer = new List<byte>();

                    String[] aa = output.Split(' ');

                    foreach (String a in aa)
                    {
                        int value = Convert.ToInt32(a, 16);
                        byte v = (byte)value;
                        buffer.Add(v);
                    }

                    serialPort1.Write(buffer.ToArray(), 0, buffer.Count);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void conrol_register12k_Click(object sender, EventArgs e)
        {
            try
            {
                String output = "CC 40";
                if (serialPort1.IsOpen)
                {
                    List<byte> buffer = new List<byte>();

                    String[] aa = output.Split(' ');

                    foreach (String a in aa)
                    {
                        int value = Convert.ToInt32(a, 16);
                        byte v = (byte)value;
                        buffer.Add(v);
                    }

                    serialPort1.Write(buffer.ToArray(), 0, buffer.Count);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnData_Fifo_Click(object sender, EventArgs e)
        {
            try
            {
                String output = "AA";//
                if (serialPort1.IsOpen)
                {
                    List<byte> buffer = new List<byte>();

                    String[] aa = output.Split(' ');

                    foreach (String a in aa)
                    {
                        int value = Convert.ToInt32(a, 16);
                        byte v = (byte)value;
                        buffer.Add(v);
                    }

                    serialPort1.Write(buffer.ToArray(), 0, buffer.Count);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            txtReceive.Text = "";
        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void cboPort_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
