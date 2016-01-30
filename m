From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91526] World of Warcraft (on Wine) has UI corruption
 with nouveau
Date: Sat, 30 Jan 2016 15:50:12 +0000
Message-ID: <bug-91526-8800-gli84GTpxS@http.bugs.freedesktop.org/>
References: <bug-91526-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1940205355=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91526-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1940205355==
Content-Type: multipart/alternative; boundary="14541690120.dEd6BE4E.5759";
 charset="UTF-8"


--14541690120.dEd6BE4E.5759
Date: Sat, 30 Jan 2016 15:50:12 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=91526

Gediminas Jakutis <gediminas-1NU85dn7e2ownf/OCUKchA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |---

--- Comment #7 from Gediminas Jakutis <gediminas-1NU85dn7e2ownf/OCUKchA@public.gmane.org> ---
This is still an issue[1], so I suppose it should be re-opened.
I assume commit d68226087cf5f2f686d6c8f3377c5a1dec3d8bc4 might be at fault, but
I haven't tested the game around that time, so I can't tell. I can bisect, if
needed.

[1] I just re-tested with the current mesa git head on a fully patched WoW
client and the problem is there.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14541690120.dEd6BE4E.5759
Date: Sat, 30 Jan 2016 15:50:12 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:gediminas&#64;varciai.lt" title="Gediminas Jakutis &lt;gediminas&#64;varciai.lt&gt;"> <span class="fn">Gediminas Jakutis</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - World of Warcraft (on Wine) has UI corruption with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91526">bug 91526</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>FIXED
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - World of Warcraft (on Wine) has UI corruption with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91526#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - World of Warcraft (on Wine) has UI corruption with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91526">bug 91526</a>
              from <span class="vcard"><a class="email" href="mailto:gediminas&#64;varciai.lt" title="Gediminas Jakutis &lt;gediminas&#64;varciai.lt&gt;"> <span class="fn">Gediminas Jakutis</span></a>
</span></b>
        <pre>This is still an issue[1], so I suppose it should be re-opened.
I assume commit d68226087cf5f2f686d6c8f3377c5a1dec3d8bc4 might be at fault, but
I haven't tested the game around that time, so I can't tell. I can bisect, if
needed.

[1] I just re-tested with the current mesa git head on a fully patched WoW
client and the problem is there.</pre>
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
--14541690120.dEd6BE4E.5759--

--===============1940205355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1940205355==--
