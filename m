From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61321] [regression][NV4c] System hang while loading
 gdm on 3.7 kernel (works on 3.6)
Date: Wed, 29 May 2013 10:54:37 +0000
Message-ID: <bug-61321-8800-u4UfbmXXAr@http.bugs.freedesktop.org/>
References: <bug-61321-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0819026720=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61321-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0819026720==
Content-Type: multipart/alternative; boundary="1369824877.1FB5eb2.2308"; charset="us-ascii"


--1369824877.1FB5eb2.2308
Date: Wed, 29 May 2013 10:54:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61321

Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
           Assignee|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
                   |rg                          |

--- Comment #11 from Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 79949
  --> https://bugs.freedesktop.org/attachment.cgi?id=79949&action=edit
initialize ramfc to zero

Just guessing, based on the commit itself. Does the patch help?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369824877.1FB5eb2.2308
Date: Wed, 29 May 2013 10:54:37 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:m.b.lankhorst&#64;gmail.com" title="Maarten Lankhorst &lt;m.b.lankhorst&#64;gmail.com&gt;"> <span class="fn">Maarten Lankhorst</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [regression][NV4c] System hang while loading gdm on 3.7 kernel (works on 3.6)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61321">bug 61321</a>
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
           <td>NEEDINFO
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Assignee</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>m.b.lankhorst&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [regression][NV4c] System hang while loading gdm on 3.7 kernel (works on 3.6)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61321#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [regression][NV4c] System hang while loading gdm on 3.7 kernel (works on 3.6)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61321">bug 61321</a>
              from <span class="vcard"><a class="email" href="mailto:m.b.lankhorst&#64;gmail.com" title="Maarten Lankhorst &lt;m.b.lankhorst&#64;gmail.com&gt;"> <span class="fn">Maarten Lankhorst</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=79949" name="attach_79949" title="initialize ramfc to zero">attachment 79949</a> <a href="attachment.cgi?id=79949&amp;action=edit" title="initialize ramfc to zero">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=61321&amp;attachment=79949'>[review]</a>
initialize ramfc to zero

Just guessing, based on the commit itself. Does the patch help?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369824877.1FB5eb2.2308--

--===============0819026720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0819026720==--
