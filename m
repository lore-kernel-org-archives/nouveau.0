From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92271] Unusably slow OpenGL performance on nouveau
 (GeForce 9600 GT) with X server 1.18 with rotated output
Date: Wed, 07 Oct 2015 23:40:12 +0000
Message-ID: <bug-92271-8800-gsHhcmA70F@http.bugs.freedesktop.org/>
References: <bug-92271-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0812045413=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92271-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0812045413==
Content-Type: multipart/alternative; boundary="1444261212.116F33.6219"; charset="UTF-8"


--1444261212.116F33.6219
Date: Wed, 7 Oct 2015 23:40:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92271

Adam Williamson <adamw-cfjF3rc+CpsYNetmKr+vY16hYfS7NtTn@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Server/Ext/GLX              |Driver/nouveau
           Assignee|xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org       |nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org
                   |                            |rg

--- Comment #14 from Adam Williamson <adamw-cfjF3rc+CpsYNetmKr+vY16hYfS7NtTn@public.gmane.org> ---
Aha, you're quite right: the issue exists if I build the xorg-x11-drv-nouveau
git snapshot we're using against X server 1.17.2, it's not the server at all.

Apologies for missing that - I was thinking "downgrade X server" and just threw
packages at the transaction till it worked, soI actually didn't notice there
was a significant difference between the nouveau driver versions too.

I will do some bisecting between 1.0.11 and the snapshot we're at and see if I
can see where it broke. I don't see anything between July 29 (when we took the
snapshot) and now that looks like it'd be relevant.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444261212.116F33.6219
Date: Wed, 7 Oct 2015 23:40:12 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:adamw&#64;happyassassin.net" title="Adam Williamson &lt;adamw&#64;happyassassin.net&gt;"> <span class="fn">Adam Williamson</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Unusably slow OpenGL performance on nouveau (GeForce 9600 GT) with X server 1.18 with rotated output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92271">bug 92271</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Component</td>
           <td>Server/Ext/GLX
           </td>
           <td>Driver/nouveau
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Assignee</td>
           <td>xorg-team&#64;lists.x.org
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Unusably slow OpenGL performance on nouveau (GeForce 9600 GT) with X server 1.18 with rotated output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92271#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Unusably slow OpenGL performance on nouveau (GeForce 9600 GT) with X server 1.18 with rotated output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92271">bug 92271</a>
              from <span class="vcard"><a class="email" href="mailto:adamw&#64;happyassassin.net" title="Adam Williamson &lt;adamw&#64;happyassassin.net&gt;"> <span class="fn">Adam Williamson</span></a>
</span></b>
        <pre>Aha, you're quite right: the issue exists if I build the xorg-x11-drv-nouveau
git snapshot we're using against X server 1.17.2, it's not the server at all.

Apologies for missing that - I was thinking &quot;downgrade X server&quot; and just threw
packages at the transaction till it worked, soI actually didn't notice there
was a significant difference between the nouveau driver versions too.

I will do some bisecting between 1.0.11 and the snapshot we're at and see if I
can see where it broke. I don't see anything between July 29 (when we took the
snapshot) and now that looks like it'd be relevant.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444261212.116F33.6219--

--===============0812045413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0812045413==--
