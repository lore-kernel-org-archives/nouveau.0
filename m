From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89019] [NV30/Gallium] Black texture using Qt5
Date: Sat, 28 Feb 2015 23:08:08 +0000
Message-ID: <bug-89019-8800-azdEzmMKub@http.bugs.freedesktop.org/>
References: <bug-89019-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0016347828=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89019-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0016347828==
Content-Type: multipart/alternative; boundary="1425164887.38eE0.20953"; charset="UTF-8"


--1425164887.38eE0.20953
Date: Sat, 28 Feb 2015 23:08:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89019

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Black texture using Qt5     |[NV30/Gallium] Black
                   |                            |texture using Qt5

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The thing immediately coming to mind was the workaround I added for dealing
with mismatching color/depth render targets. The "fix" was to just not render
to depth at all, but that may mess up other things of course. (Not the least of
which is that the depth texture will remain untouched.)

To start, you should get an apitrace (https://github.com/apitrace/apitrace) of
the failing application. This should help determine what's going on. Make a
debug mesa build and see if the driver outputs any "aaaah, i don't know how to
handle this" type messages.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1425164887.38eE0.20953
Date: Sat, 28 Feb 2015 23:08:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV30/Gallium] Black texture using Qt5"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89019">bug 89019</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Black texture using Qt5
           </td>
           <td>[NV30/Gallium] Black texture using Qt5
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV30/Gallium] Black texture using Qt5"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89019#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV30/Gallium] Black texture using Qt5"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89019">bug 89019</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The thing immediately coming to mind was the workaround I added for dealing
with mismatching color/depth render targets. The &quot;fix&quot; was to just not render
to depth at all, but that may mess up other things of course. (Not the least of
which is that the depth texture will remain untouched.)

To start, you should get an apitrace (<a href="https://github.com/apitrace/apitrace">https://github.com/apitrace/apitrace</a>) of
the failing application. This should help determine what's going on. Make a
debug mesa build and see if the driver outputs any &quot;aaaah, i don't know how to
handle this&quot; type messages.</pre>
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

--1425164887.38eE0.20953--

--===============0016347828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0016347828==--
