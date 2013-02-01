From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Fri, 01 Feb 2013 10:31:57 +0000
Message-ID: <bug-59168-8800-qoWFHjIz8U@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0198594446=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0198594446==
Content-Type: multipart/alternative; boundary="1359714717.2bEbE61.14317"; charset="us-ascii"


--1359714717.2bEbE61.14317
Date: Fri, 1 Feb 2013 10:31:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #3 from michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Created attachment 74037
  --> https://bugs.freedesktop.org/attachment.cgi?id=74037&action=edit
gdm 3.8.0-rc5 resume garbage/noise nvc3

Still the same on 3.8.0-rc5.

dmesg excerpt:
[  124.859583] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000
gnome-shell[1472]]
[  124.859603] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC2/MP: 0x001beff2
0x0000000f
[  124.860408] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000
gnome-shell[1472]]
[  124.860414] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa204021e
[  125.169451] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000
gnome-shell[1472]]
[  125.169460] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa204021e
[  125.169536] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000
gnome-shell[1472]]
[  125.169544] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa204021e

Components:
Name                          | Typ   | Version                           
------------------------------+-------+-----------------------------------
Mesa                          | Paket | 9.0.2-210.1                       
kernel                        | Paket | 3.8.0_rc5_1_desktop_nouveau01+-15 
libdrm_nouveau2               | Paket | 2.4.41-105.1                      
xorg-x11-driver-video-nouveau | Paket | 1.0.6+git@2013-01-29                    
xorg-x11-server               | Paket | 7.6_1.13.2-223.1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1359714717.2bEbE61.14317
Date: Fri, 1 Feb 2013 10:31:57 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:michael.weirauch&#64;gmail.com" title="michael.weirauch&#64;gmail.com">michael.weirauch&#64;gmail.com</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=74037" name="attach_74037" title="gdm 3.8.0-rc5 resume garbage/noise nvc3">attachment 74037</a> <a href="attachment.cgi?id=74037&amp;action=edit" title="gdm 3.8.0-rc5 resume garbage/noise nvc3">[details]</a></span>
gdm 3.8.0-rc5 resume garbage/noise nvc3

Still the same on 3.8.0-rc5.

dmesg excerpt:
[  124.859583] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000
gnome-shell[1472]]
[  124.859603] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC2/MP: 0x001beff2
0x0000000f
[  124.860408] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000
gnome-shell[1472]]
[  124.860414] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa204021e
[  125.169451] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000
gnome-shell[1472]]
[  125.169460] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa204021e
[  125.169536] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000
gnome-shell[1472]]
[  125.169544] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa204021e

Components:
Name                          | Typ   | Version                           
------------------------------+-------+-----------------------------------
Mesa                          | Paket | 9.0.2-210.1                       
kernel                        | Paket | 3.8.0_rc5_1_desktop_nouveau01+-15 
libdrm_nouveau2               | Paket | 2.4.41-105.1                      
xorg-x11-driver-video-nouveau | Paket | 1.0.6+git&#64;2013-01-29                    
xorg-x11-server               | Paket | 7.6_1.13.2-223.1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1359714717.2bEbE61.14317--

--===============0198594446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0198594446==--
