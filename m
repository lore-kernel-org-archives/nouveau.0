From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Thu, 04 Apr 2013 12:12:39 +0000
Message-ID: <bug-59168-8800-ld3PpkRkus@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1159937842=="
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


--===============1159937842==
Content-Type: multipart/alternative; boundary="1365077560.FC0CE3.28565"; charset="us-ascii"


--1365077560.FC0CE3.28565
Date: Thu, 4 Apr 2013 12:12:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #34 from michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Tested the bios script limiting patch a bit:

Plain excerpt:
[    2.601923] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    2.684360] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    2.684362] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    2.684476] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    2.684478] nouveau  [   VBIOS][0000:01:00.0] version 70.06.33.00.04
[    2.684480] nouveau D[   VBIOS][0000:01:00.0] created
[    2.684665] nouveau D[   VBIOS][0000:01:00.0] reset
[    2.684666] nouveau D[   VBIOS][0000:01:00.0] initialised
[    2.684671] nouveau  [   VBIOS][0000:01:00.0] executing script 0, offset:
54347
[    2.704681] nouveau  [   VBIOS][0000:01:00.0] executing script 1, offset:
56127
[    2.704701] nouveau  [   VBIOS][0000:01:00.0] executing script 2, offset:
61021
[    2.704702] nouveau  [   VBIOS][0000:01:00.0] executing script 3, offset:
61031
[    2.704705] nouveau  [   VBIOS][0000:01:00.0] executing script 4, offset:
61500
[    2.704706] nouveau  [   VBIOS][0000:01:00.0] executing special script,
offset: 61601


Booting with nouveau.config=DEVINIG=NvForcePost=1 and nouveau.minscript=0 and
maxscript alternatively with [999,4,3,2,1,0] I always get black screen where
the plymouth dm_crypt unlock passphrase splash should appear after loading
initrd.
System seems "fine", though. (Can't access the box via ssh at that stage. No
network set up.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1365077560.FC0CE3.28565
Date: Thu, 4 Apr 2013 12:12:40 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c34">Comment # 34</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:michael.weirauch&#64;gmail.com" title="michael.weirauch&#64;gmail.com">michael.weirauch&#64;gmail.com</a>
</span></b>
        <pre>Tested the bios script limiting patch a bit:

Plain excerpt:
[    2.601923] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    2.684360] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    2.684362] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    2.684476] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    2.684478] nouveau  [   VBIOS][0000:01:00.0] version 70.06.33.00.04
[    2.684480] nouveau D[   VBIOS][0000:01:00.0] created
[    2.684665] nouveau D[   VBIOS][0000:01:00.0] reset
[    2.684666] nouveau D[   VBIOS][0000:01:00.0] initialised
[    2.684671] nouveau  [   VBIOS][0000:01:00.0] executing script 0, offset:
54347
[    2.704681] nouveau  [   VBIOS][0000:01:00.0] executing script 1, offset:
56127
[    2.704701] nouveau  [   VBIOS][0000:01:00.0] executing script 2, offset:
61021
[    2.704702] nouveau  [   VBIOS][0000:01:00.0] executing script 3, offset:
61031
[    2.704705] nouveau  [   VBIOS][0000:01:00.0] executing script 4, offset:
61500
[    2.704706] nouveau  [   VBIOS][0000:01:00.0] executing special script,
offset: 61601


Booting with nouveau.config=DEVINIG=NvForcePost=1 and nouveau.minscript=0 and
maxscript alternatively with [999,4,3,2,1,0] I always get black screen where
the plymouth dm_crypt unlock passphrase splash should appear after loading
initrd.
System seems &quot;fine&quot;, though. (Can't access the box via ssh at that stage. No
network set up.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1365077560.FC0CE3.28565--

--===============1159937842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1159937842==--
