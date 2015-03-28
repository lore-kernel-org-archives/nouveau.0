From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89483] [NV11] Hangs on boot with external monitor
 active on Dell Latitude C810
Date: Sat, 28 Mar 2015 14:47:57 +0000
Message-ID: <bug-89483-8800-nUi85p8e0T@http.bugs.freedesktop.org/>
References: <bug-89483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1876220763=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89483-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1876220763==
Content-Type: multipart/alternative; boundary="1427554077.D2Dd442.6281"; charset="UTF-8"


--1427554077.D2Dd442.6281
Date: Sat, 28 Mar 2015 14:47:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89483

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
One thing to note is that your DCB has 3 items:

DCB 0: type 0 [ANALOG] I2C 0 heads 0 conntag 0 LOCAL OR 0 maxfreq 350000kHz
DCB 1: type 4 [???] I2C 1 heads 1 unk00_4 1 conntag 1 LOCAL OR 1
DCB 2: type 1 [TV] I2C 1 heads 0 unk00_4 1 conntag 2 EXT 0 OR 0

Type 4 is a reserved type, I've seen it used for external encoders like the
external DVI encoder on 6150SE nForce motherboards. (There is also Type 3,
LVDS, which you don't appear to have, but perhaps it didn't exist in the NV11
days.) However you're seeing a LVDS connector in the logs, which means that
*somehow* it knows...

BTW, a bunch of the dispnv04 code uses NV_DEBUG() which IIRC will show up with
drm.debug=0xe. I thought I had changed it to work with nouveau.debug, but...
you may be using an older kernel, or I'm misremembering.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427554077.D2Dd442.6281
Date: Sat, 28 Mar 2015 14:47:57 +0000
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
   title="NEW - [NV11] Hangs on boot with external monitor active on Dell Latitude C810"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89483#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV11] Hangs on boot with external monitor active on Dell Latitude C810"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89483">bug 89483</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>One thing to note is that your DCB has 3 items:

DCB 0: type 0 [ANALOG] I2C 0 heads 0 conntag 0 LOCAL OR 0 maxfreq 350000kHz
DCB 1: type 4 [???] I2C 1 heads 1 unk00_4 1 conntag 1 LOCAL OR 1
DCB 2: type 1 [TV] I2C 1 heads 0 unk00_4 1 conntag 2 EXT 0 OR 0

Type 4 is a reserved type, I've seen it used for external encoders like the
external DVI encoder on 6150SE nForce motherboards. (There is also Type 3,
LVDS, which you don't appear to have, but perhaps it didn't exist in the NV11
days.) However you're seeing a LVDS connector in the logs, which means that
*somehow* it knows...

BTW, a bunch of the dispnv04 code uses NV_DEBUG() which IIRC will show up with
drm.debug=0xe. I thought I had changed it to work with nouveau.debug, but...
you may be using an older kernel, or I'm misremembering.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427554077.D2Dd442.6281--

--===============1876220763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1876220763==--
