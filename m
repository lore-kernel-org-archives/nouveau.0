From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90626] HP ZBook 15 nouveau driver hangup for kernel
	>= 4.1
Date: Mon, 02 Nov 2015 08:46:47 +0000
Message-ID: <bug-90626-8800-Y52kRHGgVD@http.bugs.freedesktop.org/>
References: <bug-90626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0727635940=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90626-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0727635940==
Content-Type: multipart/alternative; boundary="1446454007.FBC84.1356"; charset="UTF-8"


--1446454007.FBC84.1356
Date: Mon, 2 Nov 2015 08:46:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90626

--- Comment #24 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Looks like this bios hard-codes a 4K return size for each bios chunk fetch.
There is a "fast" and a "slow" method in nouveau... the fast one grabs it all
in one go, while the "slow" one does it 4K at a time.

In drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c, try commenting out the
line

                { 0, &nvbios_acpi_fast },

For some reason we're not detecting that it's fetching a bad bios...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446454007.FBC84.1356
Date: Mon, 2 Nov 2015 08:46:47 +0000
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
   title="NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;= 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90626#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;= 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90626">bug 90626</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Looks like this bios hard-codes a 4K return size for each bios chunk fetch.
There is a &quot;fast&quot; and a &quot;slow&quot; method in nouveau... the fast one grabs it all
in one go, while the &quot;slow&quot; one does it 4K at a time.

In drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c, try commenting out the
line

                { 0, &amp;nvbios_acpi_fast },

For some reason we're not detecting that it's fetching a bad bios...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446454007.FBC84.1356--

--===============0727635940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0727635940==--
