From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90932] gm107 font glitches with kernel 4.1rc
Date: Thu, 15 Oct 2015 07:24:46 +0000
Message-ID: <bug-90932-8800-yuT8ZvtHMT@http.bugs.freedesktop.org/>
References: <bug-90932-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0176995022=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90932-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0176995022==
Content-Type: multipart/alternative; boundary="1444893886.bDb575bf3.8439"; charset="UTF-8"


--1444893886.bDb575bf3.8439
Date: Thu, 15 Oct 2015 07:24:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90932

--- Comment #20 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 118882
  --> https://bugs.freedesktop.org/attachment.cgi?id=118882&action=edit
serialize when vbo dirty

This (mesa) patch seems to help Ben when using GLAMOR on Kepler chips. Could
give it a shot to see if it improves the Maxwell situation as well. Doubtful
that it's the "right" thing though.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444893886.bDb575bf3.8439
Date: Thu, 15 Oct 2015 07:24:46 +0000
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
   title="NEW - gm107 font glitches with kernel 4.1rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90932#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - gm107 font glitches with kernel 4.1rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90932">bug 90932</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=118882" name="attach_118882" title="serialize when vbo dirty">attachment 118882</a> <a href="attachment.cgi?id=118882&amp;action=edit" title="serialize when vbo dirty">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=90932&amp;attachment=118882'>[review]</a>
serialize when vbo dirty

This (mesa) patch seems to help Ben when using GLAMOR on Kepler chips. Could
give it a shot to see if it improves the Maxwell situation as well. Doubtful
that it's the &quot;right&quot; thing though.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444893886.bDb575bf3.8439--

--===============0176995022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0176995022==--
