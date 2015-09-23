From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92072] Wine breakage since d082c5324 (st/mesa: don't
 call st_validate_state in BlitFramebuffer)
Date: Wed, 23 Sep 2015 10:28:41 +0000
Message-ID: <bug-92072-8800-vVQ6w20B3g@http.bugs.freedesktop.org/>
References: <bug-92072-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0541436770=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92072-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0541436770==
Content-Type: multipart/alternative; boundary="1443004121.23cdC42B1.16737"; charset="UTF-8"


--1443004121.23cdC42B1.16737
Date: Wed, 23 Sep 2015 10:28:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92072

Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Mesa core                   |Drivers/DRI/nouveau
           Assignee|mesa-dev-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org |nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org
                   |org                         |rg
         QA Contact|mesa-dev-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org |nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org
                   |org                         |rg

--- Comment #5 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #4)
> FYI Marek has a fix: http://patchwork.freedesktop.org/patch/60146/
> 
> I tested it with this trace, and it seems to fix it.

Yes, just tested it - works fine for both UT and 3Dmark2000! Thanks, Marek!

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1443004121.23cdC42B1.16737
Date: Wed, 23 Sep 2015 10:28:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:randrik&#64;mail.ru" title="Andrew Randrianasulu &lt;randrik&#64;mail.ru&gt;"> <span class="fn">Andrew Randrianasulu</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Wine breakage since d082c5324 (st/mesa: don't call st_validate_state in BlitFramebuffer)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92072">bug 92072</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Component</td>
           <td>Mesa core
           </td>
           <td>Drivers/DRI/nouveau
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Assignee</td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">QA Contact</td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Wine breakage since d082c5324 (st/mesa: don't call st_validate_state in BlitFramebuffer)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92072#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Wine breakage since d082c5324 (st/mesa: don't call st_validate_state in BlitFramebuffer)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92072">bug 92072</a>
              from <span class="vcard"><a class="email" href="mailto:randrik&#64;mail.ru" title="Andrew Randrianasulu &lt;randrik&#64;mail.ru&gt;"> <span class="fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=92072#c4">comment #4</a>)
<span class="quote">&gt; FYI Marek has a fix: <a href="http://patchwork.freedesktop.org/patch/60146/">http://patchwork.freedesktop.org/patch/60146/</a>
&gt; 
&gt; I tested it with this trace, and it seems to fix it.</span >

Yes, just tested it - works fine for both UT and 3Dmark2000! Thanks, Marek!</pre>
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

--1443004121.23cdC42B1.16737--

--===============0541436770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0541436770==--
