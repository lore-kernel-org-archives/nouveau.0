From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88535] Mesa 10.3.0 implementation error:
 gen7_update_renderbuffer_surface: renderbuffer format
 MESA_FORMAT_RGBX_UNORM16 unsupported
Date: Sun, 18 Jan 2015 15:09:02 +0000
Message-ID: <bug-88535-8800-j0cerZvTaC@http.bugs.freedesktop.org/>
References: <bug-88535-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1375575649=="
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


--===============1375575649==
Content-Type: multipart/alternative; boundary="1421593742.Cbf71.26959"; charset="UTF-8"


--1421593742.Cbf71.26959
Date: Sun, 18 Jan 2015 15:09:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88535

dexcelstraun7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Drivers/DRI/nouveau         |Mesa core
           Assignee|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |mesa-dev-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org
                   |rg                          |org

--- Comment #2 from dexcelstraun7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to Tobias Klausmann from comment #1)
> I'm quite certain, that nouveau does not support the 9xx series for now,
> except modesettings and the "gen7_update_renderbuffer_surface" points to an
> error with the intel driver. You have an so called optimus/prime system with
> two cards, intel and nvidia. Please sort out which card you are actually
> using.

You are correct, I was using the Intel GPU, not the nVidia one like I had
assumed. I suppose this ticket should be re-assigned, but I don't know the

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421593742.Cbf71.26959
Date: Sun, 18 Jan 2015 15:09:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:dexcelstraun7&#64;gmail.com" title="dexcelstraun7&#64;gmail.com">dexcelstraun7&#64;gmail.com</a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Mesa 10.3.0 implementation error: gen7_update_renderbuffer_surface: renderbuffer format MESA_FORMAT_RGBX_UNORM16 unsupported"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88535">bug 88535</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Component</td>
           <td>Drivers/DRI/nouveau
           </td>
           <td>Mesa core
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Assignee</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Mesa 10.3.0 implementation error: gen7_update_renderbuffer_surface: renderbuffer format MESA_FORMAT_RGBX_UNORM16 unsupported"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88535#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Mesa 10.3.0 implementation error: gen7_update_renderbuffer_surface: renderbuffer format MESA_FORMAT_RGBX_UNORM16 unsupported"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88535">bug 88535</a>
              from <span class="vcard"><a class="email" href="mailto:dexcelstraun7&#64;gmail.com" title="dexcelstraun7&#64;gmail.com">dexcelstraun7&#64;gmail.com</a>
</span></b>
        <pre>(In reply to Tobias Klausmann from <a href="show_bug.cgi?id=88535#c1">comment #1</a>)
<span class="quote">&gt; I'm quite certain, that nouveau does not support the 9xx series for now,
&gt; except modesettings and the &quot;gen7_update_renderbuffer_surface&quot; points to an
&gt; error with the intel driver. You have an so called optimus/prime system with
&gt; two cards, intel and nvidia. Please sort out which card you are actually
&gt; using.</span >

You are correct, I was using the Intel GPU, not the nVidia one like I had
assumed. I suppose this ticket should be re-assigned, but I don't know the</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421593742.Cbf71.26959--

--===============1375575649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1375575649==--
