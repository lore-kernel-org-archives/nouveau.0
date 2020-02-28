From: Felix Miata <mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org>
Subject: where to report modesetting DDX bug?
Date: Fri, 28 Feb 2020 11:06:02 -0500
Message-ID: <105a5043-8cc0-43cd-42bf-a79cafbd2320@earthlink.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Video and input drivers Subgroups and projects on gitlab does not list modesetting
DDX, presumably because it's not packaged separately from the server. Where's the
right place to report a modesetting DDX bug that manifests only on an NVidia GPU?
Directly against the server https://gitlab.freedesktop.org/xorg/xserver?

Here are some particulars:
How can I tell whether this should be reported to kernel tracker or to freedesktop
tracker as driver or server problem? HDMI output on GT218 10de:0a65 GPU is limited
to 1920x1200. When connected to 2560x1440 display, vttys are supported at
display's supported 1920x1080 mode, but X with modesetting DDX puts display in
unsupported mode (functionally asleep) regardless of various attempts to force
1920x1080@60 or 1600x900@60, while with nouveau DDX, or 1920x1200 display, or
2560x1440 display with Dual-link DVI cable, display behavior is as expected.

openSUSE 15.1/kernel 4.12.14	OK
openSUSE 15.2/kernel 5.3.18	bad
Tumbleweed/kernel 5.4.14	bad
Debian Buster/kernel 4.19.x	OK
Fedora 31/5.5.5 kernel		bad

http://fm.no-ip.com/Tmp/Linux/Xorg/xorg.0.log-gt218-stw-modesetting-OOR-0x1e
http://fm.no-ip.com/Tmp/Linux/Xorg/gt218-dmesg-stw.txt
-- 
Evolution as taught in public schools is religion, not science.

 Team OS/2 ** Reg. Linux User #211409 ** a11y rocks!

Felix Miata  ***  http://fm.no-ip.com/
