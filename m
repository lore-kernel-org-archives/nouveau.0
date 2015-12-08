From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81690] nouveau GPU locks up under memory pressure
Date: Tue, 08 Dec 2015 10:47:07 +0000
Message-ID: <bug-81690-8800-o7zKc9Pvss@http.bugs.freedesktop.org/>
References: <bug-81690-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1047974308=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81690-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1047974308==
Content-Type: multipart/alternative; boundary="1449571627.5DeDAF4.6507"; charset="UTF-8"


--1449571627.5DeDAF4.6507
Date: Tue, 8 Dec 2015 10:47:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81690

Daniel <ted.korostiled-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ted.korostiled-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #9 from Daniel <ted.korostiled-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 120413
  --> https://bugs.freedesktop.org/attachment.cgi?id=120413&action=edit
freeze log

I'm getting similar issues after while. See my log file.

lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GF116 [GeForce GTX 550
Ti] (rev a1)

Is it related?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1449571627.5DeDAF4.6507
Date: Tue, 8 Dec 2015 10:47:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:ted.korostiled&#64;gmail.com" title="Daniel &lt;ted.korostiled&#64;gmail.com&gt;"> <span class="fn">Daniel</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau GPU locks up under memory pressure"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81690">bug 81690</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>ted.korostiled&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau GPU locks up under memory pressure"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81690#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau GPU locks up under memory pressure"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81690">bug 81690</a>
              from <span class="vcard"><a class="email" href="mailto:ted.korostiled&#64;gmail.com" title="Daniel &lt;ted.korostiled&#64;gmail.com&gt;"> <span class="fn">Daniel</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=120413" name="attach_120413" title="freeze log">attachment 120413</a> <a href="attachment.cgi?id=120413&amp;action=edit" title="freeze log">[details]</a></span>
freeze log

I'm getting similar issues after while. See my log file.

lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GF116 [GeForce GTX 550
Ti] (rev a1)

Is it related?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1449571627.5DeDAF4.6507--

--===============1047974308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1047974308==--
