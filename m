From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Tue, 12 Mar 2013 07:54:42 +0000
Message-ID: <bug-59168-8800-pjHBhKASbj@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1662156730=="
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


--===============1662156730==
Content-Type: multipart/alternative; boundary="1363074882.E0B5E85.31220"; charset="us-ascii"


--1363074882.E0B5E85.31220
Date: Tue, 12 Mar 2013 07:54:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #29 from Rolf Offermanns <rolf.offermanns-hi6Y0CQ0nG0@public.gmane.org> ---
My results from 3.9.0rc1:
Suspend
-------
Mar 11 18:07:46 rof-lap kernel: [  222.304276] nouveau  [     DRM] suspending
fbcon...
Mar 11 18:07:46 rof-lap kernel: [  222.304298] nouveau  [     DRM] suspending
display...
Mar 11 18:07:46 rof-lap kernel: [  222.304310] nouveau  [     DRM] unpinning
framebuffer(s)...
Mar 11 18:07:46 rof-lap kernel: [  222.304409] nouveau  [     DRM] evicting
buffers...
Mar 11 18:07:46 rof-lap kernel: [  222.517459] sd 0:0:0:0: [sda] Stopping disk
Mar 11 18:07:46 rof-lap kernel: [  222.652940] nouveau  [     DRM] suspending
client object trees...
Mar 11 18:07:46 rof-lap kernel: [  222.653078] nouveau W[  
PFIFO][0000:01:00.0] INTR 0x00000001: 0x00000004
Mar 11 18:07:46 rof-lap kernel: [  222.653254] nouveau W[  
PFIFO][0000:01:00.0] INTR 0x00000001: 0x00000004
[...]

Resume
------
Mar 11 18:07:46 rof-lap kernel: [  224.980347] nouveau  [     DRM] re-enabling
device...
Mar 11 18:07:46 rof-lap kernel: [  224.980367] nouveau  [     DRM] resuming
client object trees...
Mar 11 18:07:46 rof-lap kernel: [  224.980374] nouveau  [  
VBIOS][0000:01:00.0] running init tables
Mar 11 18:07:46 rof-lap kernel: [  225.167093] nouveau  [ 
PTHERM][0000:01:00.0] programmed thresholds [ 90(3), 95(3), 105(5), 135(5) ]
Mar 11 18:07:46 rof-lap kernel: [  225.168112] nouveau  [     DRM] resuming
display...
[...]
Mar 11 18:07:47 rof-lap kernel: [  227.558681] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.558690] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.559484] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.559491] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.559645] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.559651] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.559795] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.559801] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.559946] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.559952] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.560097] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.560102] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.560247] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.560253] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.560403] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.560409] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.561045] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.561052] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.561201] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
:
[...]


Restarting Xorg resolves the problem until next suspend.

01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [GeForce GT 540M]
(rev a1)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1363074882.E0B5E85.31220
Date: Tue, 12 Mar 2013 07:54:42 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:rolf.offermanns&#64;gmx.net" title="Rolf Offermanns &lt;rolf.offermanns&#64;gmx.net&gt;"> <span class="fn">Rolf Offermanns</span></a>
</span></b>
        <pre>My results from 3.9.0rc1:
Suspend
-------
Mar 11 18:07:46 rof-lap kernel: [  222.304276] nouveau  [     DRM] suspending
fbcon...
Mar 11 18:07:46 rof-lap kernel: [  222.304298] nouveau  [     DRM] suspending
display...
Mar 11 18:07:46 rof-lap kernel: [  222.304310] nouveau  [     DRM] unpinning
framebuffer(s)...
Mar 11 18:07:46 rof-lap kernel: [  222.304409] nouveau  [     DRM] evicting
buffers...
Mar 11 18:07:46 rof-lap kernel: [  222.517459] sd 0:0:0:0: [sda] Stopping disk
Mar 11 18:07:46 rof-lap kernel: [  222.652940] nouveau  [     DRM] suspending
client object trees...
Mar 11 18:07:46 rof-lap kernel: [  222.653078] nouveau W[  
PFIFO][0000:01:00.0] INTR 0x00000001: 0x00000004
Mar 11 18:07:46 rof-lap kernel: [  222.653254] nouveau W[  
PFIFO][0000:01:00.0] INTR 0x00000001: 0x00000004
[...]

Resume
------
Mar 11 18:07:46 rof-lap kernel: [  224.980347] nouveau  [     DRM] re-enabling
device...
Mar 11 18:07:46 rof-lap kernel: [  224.980367] nouveau  [     DRM] resuming
client object trees...
Mar 11 18:07:46 rof-lap kernel: [  224.980374] nouveau  [  
VBIOS][0000:01:00.0] running init tables
Mar 11 18:07:46 rof-lap kernel: [  225.167093] nouveau  [ 
PTHERM][0000:01:00.0] programmed thresholds [ 90(3), 95(3), 105(5), 135(5) ]
Mar 11 18:07:46 rof-lap kernel: [  225.168112] nouveau  [     DRM] resuming
display...
[...]
Mar 11 18:07:47 rof-lap kernel: [  227.558681] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.558690] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.559484] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.559491] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.559645] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.559651] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.559795] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.559801] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.559946] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.559952] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.560097] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.560102] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.560247] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.560253] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.560403] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.560409] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.561045] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
Mar 11 18:07:47 rof-lap kernel: [  227.561052] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Mar 11 18:07:47 rof-lap kernel: [  227.561201] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000 X[920]]
:
[...]


Restarting Xorg resolves the problem until next suspend.

01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [GeForce GT 540M]
(rev a1)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1363074882.E0B5E85.31220--

--===============1662156730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1662156730==--
