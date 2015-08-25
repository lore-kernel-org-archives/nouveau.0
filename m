From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91738] [NV117] NULL deref in
 nvkm_i2c_try_acquire_pad, kernel 4.1
Date: Tue, 25 Aug 2015 04:38:28 +0000
Message-ID: <bug-91738-8800-PjwtxRa96Q@http.bugs.freedesktop.org/>
References: <bug-91738-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1829351407=="
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


--===============1829351407==
Content-Type: multipart/alternative; boundary="1440477508.2efBFFd1.29939"; charset="UTF-8"


--1440477508.2efBFFd1.29939
Date: Tue, 25 Aug 2015 04:38:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91738

--- Comment #14 from ryanpcmcquen <ryan.q-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org> ---
Created attachment 117904
  --> https://bugs.freedesktop.org/attachment.cgi?id=117904&action=edit
/sys/kernel/debug/dri/0/vbios.rom

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440477508.2efBFFd1.29939
Date: Tue, 25 Aug 2015 04:38:28 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_UNCONFIRMED "
   title="UNCONFIRMED - [NV117] NULL deref in nvkm_i2c_try_acquire_pad, kernel 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738">bug 91738</a>
              from <span class="vcard"><a class="email" href="mailto:ryan.q&#64;linux.com" title="ryanpcmcquen &lt;ryan.q&#64;linux.com&gt;"> <span class="fn">ryanpcmcquen</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=117904" name="attach_117904" title="/sys/kernel/debug/dri/0/vbios.rom">attachment 117904</a> <a href="attachment.cgi?id=117904&amp;action=edit" title="/sys/kernel/debug/dri/0/vbios.rom">[details]</a></span>
/sys/kernel/debug/dri/0/vbios.rom</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440477508.2efBFFd1.29939--

--===============1829351407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1829351407==--
