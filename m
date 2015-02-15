From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87819] [NVAC] EQ overflowing
Date: Sun, 15 Feb 2015 01:44:47 +0000
Message-ID: <bug-87819-8800-Cy8AWsd7LE@http.bugs.freedesktop.org/>
References: <bug-87819-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0333589713=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87819-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0333589713==
Content-Type: multipart/alternative; boundary="1423964687.8Fb6E1.18514"; charset="UTF-8"


--1423964687.8Fb6E1.18514
Date: Sun, 15 Feb 2015 01:44:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87819

--- Comment #17 from Stuart Longland <stuartl-3e+Fe6x+Dsh6S/UX/emfpkB+6BGkLq7r@public.gmane.org> ---
So far, so good.  I've been tinkering for an hour and haven't yet triggered the
EQ overflow.

So the standard vanilla 3.19 kernel's nouveau module is talking nicely to the
GPU and both are getting along well.  I haven't yet checked out the out-of-tree
module.

I'm seeing no kernel messages regarding the video device either, other than
what shows in `dmesg` on boot-up.  Whatever went upstream between 3.18 and 3.19
seems to be doing the trick.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1423964687.8Fb6E1.18514
Date: Sun, 15 Feb 2015 01:44:47 +0000
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
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819">bug 87819</a>
              from <span class="vcard"><a class="email" href="mailto:stuartl&#64;longlandclan.yi.org" title="Stuart Longland &lt;stuartl&#64;longlandclan.yi.org&gt;"> <span class="fn">Stuart Longland</span></a>
</span></b>
        <pre>So far, so good.  I've been tinkering for an hour and haven't yet triggered the
EQ overflow.

So the standard vanilla 3.19 kernel's nouveau module is talking nicely to the
GPU and both are getting along well.  I haven't yet checked out the out-of-tree
module.

I'm seeing no kernel messages regarding the video device either, other than
what shows in `dmesg` on boot-up.  Whatever went upstream between 3.18 and 3.19
seems to be doing the trick.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423964687.8Fb6E1.18514--

--===============0333589713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0333589713==--
