From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91738] [NV117] NULL deref in
 nvkm_i2c_try_acquire_pad, kernel 4.1
Date: Tue, 25 Aug 2015 03:33:51 +0000
Message-ID: <bug-91738-8800-h3AErlMNIc@http.bugs.freedesktop.org/>
References: <bug-91738-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0524045967=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91738-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0524045967==
Content-Type: multipart/alternative; boundary="1440473631.Bee52.22725"; charset="UTF-8"


--1440473631.Bee52.22725
Date: Tue, 25 Aug 2015 03:33:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91738

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Add nouveau.modeset=0 to your kernel cmdline, that should prevent nouveau from
loading. I believe that xcmddc is killing of CPU's one-by-one as nouveau is
mishandling something it's asking for.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440473631.Bee52.22725
Date: Tue, 25 Aug 2015 03:33:51 +0000
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
          bz_status_UNCONFIRMED "
   title="UNCONFIRMED - [NV117] NULL deref in nvkm_i2c_try_acquire_pad, kernel 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_UNCONFIRMED "
   title="UNCONFIRMED - [NV117] NULL deref in nvkm_i2c_try_acquire_pad, kernel 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738">bug 91738</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Add nouveau.modeset=0 to your kernel cmdline, that should prevent nouveau from
loading. I believe that xcmddc is killing of CPU's one-by-one as nouveau is
mishandling something it's asking for.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440473631.Bee52.22725--

--===============0524045967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0524045967==--
