From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88515] After waking up from sleep nouveau fails with
	errors
Date: Sun, 18 Jan 2015 05:37:19 +0000
Message-ID: <bug-88515-8800-nefqJvgiSr@http.bugs.freedesktop.org/>
References: <bug-88515-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1851880015=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88515-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1851880015==
Content-Type: multipart/alternative; boundary="1421559438.6dafE2.13755"; charset="UTF-8"


--1421559438.6dafE2.13755
Date: Sun, 18 Jan 2015 05:37:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88515

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Tobias Klausmann from comment #3)
> I don't know about Ubuntu, sorry. Try asking in a Ubuntu related channel or
> open a bug at their bugtracker and mention its fixed with 3.19-rcX.
> 
> Leaving this open for a while, just in case something problematic comes up...

Canonical decides what Ubuntu does, not nouveau. This is fixed upstream, so
it's good from our perspective.

If you can identify which patch specifically fixes it, we can try to send it to
stable, however a ton of stuff changed since 3.13 and it may not be possible to
backport.

Marking this as fixed, if you identify the patch, start a discussion at
nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org about it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421559438.6dafE2.13755
Date: Sun, 18 Jan 2015 05:37:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - After waking up from sleep nouveau fails with errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88515">bug 88515</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - After waking up from sleep nouveau fails with errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88515#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - After waking up from sleep nouveau fails with errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88515">bug 88515</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Tobias Klausmann from <a href="show_bug.cgi?id=88515#c3">comment #3</a>)
<span class="quote">&gt; I don't know about Ubuntu, sorry. Try asking in a Ubuntu related channel or
&gt; open a bug at their bugtracker and mention its fixed with 3.19-rcX.
&gt; 
&gt; Leaving this open for a while, just in case something problematic comes up...</span >

Canonical decides what Ubuntu does, not nouveau. This is fixed upstream, so
it's good from our perspective.

If you can identify which patch specifically fixes it, we can try to send it to
stable, however a ton of stuff changed since 3.13 and it may not be possible to
backport.

Marking this as fixed, if you identify the patch, start a discussion at
<a href="mailto:nouveau&#64;lists.freedesktop.org">nouveau&#64;lists.freedesktop.org</a> about it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421559438.6dafE2.13755--

--===============1851880015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1851880015==--
