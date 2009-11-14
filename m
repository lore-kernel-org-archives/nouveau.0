From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25088] New: Nouveau and KMS doesn't support dual
	monitors
Date: Sat, 14 Nov 2009 10:21:33 -0800 (PST)
Message-ID: <bug-25088-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=25088

           Summary: Nouveau and KMS doesn't support dual monitors
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: fredthejonester-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=31201)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31201)
Files

I have a  G98 [GeForce 9300 GS] and I run Arch Linux. Xorg is 1.7. I have 2
monitors and with nvidia, they worked. With nouvea without KMS they also
worked, but if I turn KMS on, then I get this:

[f@localhost ~]$ xrandr
Screen 0: minimum 320 x 200, current 1024 x 768, maximum 8192 x 8192
DVI-I-0 connected 1024x768+0+0 (normal left inverted right x axis y axis) 310mm
x 230mm
   1024x768       85.0*+   85.0     75.1     70.1     60.0  
   1280x1024      60.0  
   800x600        85.1     72.2     75.0     60.3     56.2  
   640x480        72.8     75.0     60.0  
   720x400        70.1  
VGA-0 disconnected (normal left inverted right x axis y axis)
[f@localhost ~]$ grep MODULES= /etc/mkinitcpio.conf
#     MODULES="piix ide_disk reiserfs"
MODULES="nouveau"

I put 

nouveau.modeset=1

in my kernel line in grub.lst to turn KMS on. With it off, two monitors work,
but it's buggy:

1. I also have a bug with nouveau that sometimes colors change at random in FF
and Thunderbird. What happens it that half the text on a page on FF suddenly
goes white, for no known reason. I must restart FF and then it's OK. 

2. The whole system is very slow. When I launch an app or save a spreadsheet,
it takes literally a few seconds. Should be fast on a dual core 2G CPU with 2 G
RAM.

I attached what I hope are the relevant files. I run use Xfce 4.6.1. Sorry they
are zipped, but the files are not small. It's dmesg ouput and Xorg.0.log.

I am using nouveau-drm : 20091111 which I got via this:

ftp://ftp.rez-gif.supelec.fr/Linux/archlinux/testing/os/i686/nouveau-drm-0.0.15_20091111-1-i686.pkg.tar.gz

I tried with stable nouvea and it was the same, so I tried this version. Both
are the same.

I hope this is the relevant information.

Thanks.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
