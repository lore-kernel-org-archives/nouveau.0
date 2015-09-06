From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91890] [nve7] witcher2: blurry image & DATA_ERRORs
 (class 0xa097 mthd 0x2380/0x238c)
Date: Sun, 06 Sep 2015 05:43:26 +0000
Message-ID: <bug-91890-8800-KhtEft4c5f@http.bugs.freedesktop.org/>
References: <bug-91890-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1726496684=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91890-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1726496684==
Content-Type: multipart/alternative; boundary="1441518206.BF6cB1.26919"; charset="UTF-8"


--1441518206.BF6cB1.26919
Date: Sun, 6 Sep 2015 05:43:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91890

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 118094
  --> https://bugs.freedesktop.org/attachment.cgi?id=118094&action=edit
cb management patch

This is a very preliminary patch, but in replaying the above trace, I get the
same results as on intel (at least on the last frame). And at least with mesa
10.6.3, I do see the same blurriness as you did. (Fun, looks like it makes use
of GL_DEPTH_BOUNDS_TEST_EXT, which wasn't available in 10.6.3.)

Please confirm that the included patch fixes the blurriness. It's a
pile-o-hacks right now, but could definitely be cleaned up. I've been aware of
this issue for a while, but didn't have a reason to fix until now.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1441518206.BF6cB1.26919
Date: Sun, 6 Sep 2015 05:43:26 +0000
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
   title="NEW - [nve7] witcher2: blurry image &amp; DATA_ERRORs (class 0xa097 mthd 0x2380/0x238c)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91890#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [nve7] witcher2: blurry image &amp; DATA_ERRORs (class 0xa097 mthd 0x2380/0x238c)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91890">bug 91890</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=118094" name="attach_118094" title="cb management patch">attachment 118094</a> <a href="attachment.cgi?id=118094&amp;action=edit" title="cb management patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=91890&amp;attachment=118094'>[review]</a>
cb management patch

This is a very preliminary patch, but in replaying the above trace, I get the
same results as on intel (at least on the last frame). And at least with mesa
10.6.3, I do see the same blurriness as you did. (Fun, looks like it makes use
of GL_DEPTH_BOUNDS_TEST_EXT, which wasn't available in 10.6.3.)

Please confirm that the included patch fixes the blurriness. It's a
pile-o-hacks right now, but could definitely be cleaned up. I've been aware of
this issue for a while, but didn't have a reason to fix until now.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441518206.BF6cB1.26919--

--===============1726496684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1726496684==--
