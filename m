From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Thu, 07 Feb 2013 09:05:44 +0000
Message-ID: <bug-59168-8800-zitDXf2PPF@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1124629625=="
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


--===============1124629625==
Content-Type: multipart/alternative; boundary="1360227944.4bbC24.19992"; charset="us-ascii"


--1360227944.4bbC24.19992
Date: Thu, 7 Feb 2013 09:05:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #5 from michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Created attachment 74325
  --> https://bugs.freedesktop.org/attachment.cgi?id=74325&action=edit
dmesg 3.8.0-rc5 resume garbage/noise nvc3

Regular report with updated companion components:

* Still same garbage as before. System luckily didn't lock up when killing X.
* Can use system after restarting X.
* Garbage/Noise switched to white after "Tab"ing and moving mouse a bit on gdm
screen.

demsg excerpt:
[  197.939969] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000
gnome-shell[1476]]
[  197.939992] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC1/MP: 0x001beff2
0x0000000f
[  197.940851] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000
gnome-shell[1476]]
[  197.940858] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa204021e
[  197.952710] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000
gnome-shell[1476]]
[  197.952722] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa204021e
[  197.952805] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000
gnome-shell[1476]]
[  197.952816] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa204021e

Components:
Name                          | Typ   | Version                           
------------------------------+-------+-----------------------------------
Mesa                          | Paket | 9.0.98.82-221.1                   
kernel                        | Paket | 3.8.0_rc5_1_desktop_nouveau01+-15 
libdrm_nouveau2               | Paket | 2.4.42-109.1                      
xorg-x11-driver-video-nouveau | Paket | 1.0.6+git@2013-02-07                    
xorg-x11-server               | Paket | 7.6_1.13.99.901-226.1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360227944.4bbC24.19992
Date: Thu, 7 Feb 2013 09:05:44 +0000
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
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:michael.weirauch&#64;gmail.com" title="michael.weirauch&#64;gmail.com">michael.weirauch&#64;gmail.com</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=74325" name="attach_74325" title="dmesg 3.8.0-rc5 resume garbage/noise nvc3">attachment 74325</a> <a href="attachment.cgi?id=74325&amp;action=edit" title="dmesg 3.8.0-rc5 resume garbage/noise nvc3">[details]</a></span>
dmesg 3.8.0-rc5 resume garbage/noise nvc3

Regular report with updated companion components:

* Still same garbage as before. System luckily didn't lock up when killing X.
* Can use system after restarting X.
* Garbage/Noise switched to white after &quot;Tab&quot;ing and moving mouse a bit on gdm
screen.

demsg excerpt:
[  197.939969] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000
gnome-shell[1476]]
[  197.939992] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC1/MP: 0x001beff2
0x0000000f
[  197.940851] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000
gnome-shell[1476]]
[  197.940858] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa204021e
[  197.952710] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000
gnome-shell[1476]]
[  197.952722] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa204021e
[  197.952805] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000
gnome-shell[1476]]
[  197.952816] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa204021e

Components:
Name                          | Typ   | Version                           
------------------------------+-------+-----------------------------------
Mesa                          | Paket | 9.0.98.82-221.1                   
kernel                        | Paket | 3.8.0_rc5_1_desktop_nouveau01+-15 
libdrm_nouveau2               | Paket | 2.4.42-109.1                      
xorg-x11-driver-video-nouveau | Paket | 1.0.6+git&#64;2013-02-07                    
xorg-x11-server               | Paket | 7.6_1.13.99.901-226.1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360227944.4bbC24.19992--

--===============1124629625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1124629625==--
