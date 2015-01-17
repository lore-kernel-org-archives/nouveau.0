From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88535] Mesa 10.3.0 implementation error:
 gen7_update_renderbuffer_surface: renderbuffer format
 MESA_FORMAT_RGBX_UNORM16 unsupported
Date: Sat, 17 Jan 2015 15:03:21 +0000
Message-ID: <bug-88535-8800-z1WJrfdWJ0@http.bugs.freedesktop.org/>
References: <bug-88535-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0588578807=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88535-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0588578807==
Content-Type: multipart/alternative; boundary="1421507001.a48cc1.3574"; charset="UTF-8"


--1421507001.a48cc1.3574
Date: Sat, 17 Jan 2015 15:03:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88535

--- Comment #1 from Tobias Klausmann <tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> ---
I'm quite certain, that nouveau does not support the 9xx series for now, except
modesettings and the "gen7_update_renderbuffer_surface" points to an error with
the intel driver. You have an so called optimus/prime system with two cards,
intel and nvidia. Please sort out which card you are actually using.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421507001.a48cc1.3574
Date: Sat, 17 Jan 2015 15:03:21 +0000
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
   title="NEW - Mesa 10.3.0 implementation error: gen7_update_renderbuffer_surface: renderbuffer format MESA_FORMAT_RGBX_UNORM16 unsupported"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88535#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Mesa 10.3.0 implementation error: gen7_update_renderbuffer_surface: renderbuffer format MESA_FORMAT_RGBX_UNORM16 unsupported"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88535">bug 88535</a>
              from <span class="vcard"><a class="email" href="mailto:tobias.klausmann&#64;mni.thm.de" title="Tobias Klausmann &lt;tobias.klausmann&#64;mni.thm.de&gt;"> <span class="fn">Tobias Klausmann</span></a>
</span></b>
        <pre>I'm quite certain, that nouveau does not support the 9xx series for now, except
modesettings and the &quot;gen7_update_renderbuffer_surface&quot; points to an error with
the intel driver. You have an so called optimus/prime system with two cards,
intel and nvidia. Please sort out which card you are actually using.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421507001.a48cc1.3574--

--===============0588578807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0588578807==--
