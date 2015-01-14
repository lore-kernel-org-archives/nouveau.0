From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87715] [NV50] Changing resolution away from
 1680x1050 results in scattered display
Date: Wed, 14 Jan 2015 06:58:09 +0000
Message-ID: <bug-87715-8800-UL9K2LC5P1@http.bugs.freedesktop.org/>
References: <bug-87715-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2147466468=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87715-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2147466468==
Content-Type: multipart/alternative; boundary="1421218688.Fe7AFf1.29575"; charset="UTF-8"


--1421218688.Fe7AFf1.29575
Date: Wed, 14 Jan 2015 06:58:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87715

--- Comment #8 from Bruno Wolff <bruno-bdMChIhFSYk@public.gmane.org> ---
Does
http://cgit.freedesktop.org/mesa/drm/commit/?id=d7c0a08bc576deb07df6c3f91f393ca8edd0c4bf
(modetest: Allocate dumb buffers with the correct bpp) look like a change that
might help me? (i.e. is it worth me rebuilding libdrm to test?)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421218688.Fe7AFf1.29575
Date: Wed, 14 Jan 2015 06:58:08 +0000
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
   title="NEW - [NV50] Changing resolution away from 1680x1050 results in scattered display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87715#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV50] Changing resolution away from 1680x1050 results in scattered display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87715">bug 87715</a>
              from <span class="vcard"><a class="email" href="mailto:bruno&#64;wolff.to" title="Bruno Wolff &lt;bruno&#64;wolff.to&gt;"> <span class="fn">Bruno Wolff</span></a>
</span></b>
        <pre>Does
<a href="http://cgit.freedesktop.org/mesa/drm/commit/?id=d7c0a08bc576deb07df6c3f91f393ca8edd0c4bf">http://cgit.freedesktop.org/mesa/drm/commit/?id=d7c0a08bc576deb07df6c3f91f393ca8edd0c4bf</a>
(modetest: Allocate dumb buffers with the correct bpp) look like a change that
might help me? (i.e. is it worth me rebuilding libdrm to test?)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421218688.Fe7AFf1.29575--

--===============2147466468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2147466468==--
