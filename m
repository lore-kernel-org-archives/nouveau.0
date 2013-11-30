From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64323] Severe misrendering in Left 4 Dead 2
Date: Sat, 30 Nov 2013 04:17:44 +0000
Message-ID: <bug-64323-8800-MyLoCpAI56@http.bugs.freedesktop.org/>
References: <bug-64323-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1031183580=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64323-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1031183580==
Content-Type: multipart/alternative; boundary="1385785065.5Ab35f3.19198"; charset="us-ascii"


--1385785065.5Ab35f3.19198
Date: Sat, 30 Nov 2013 04:17:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64323

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #89968|0                           |1
        is obsolete|                            |

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 90011
  --> https://bugs.freedesktop.org/attachment.cgi?id=90011&action=edit
a different workaround

OK, I played around with a lot of different options. It actually turns out that
my last patch leaks fences. And it waits on fence instead of fence_wr. The new
version fixes all these issues.

Sticking in a semaphore acquire instead helped a bit, but the rendering was
still not right. Even if I used screen->fence.current. So wait it must be :(

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385785065.5Ab35f3.19198
Date: Sat, 30 Nov 2013 04:17:45 +0000
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
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323">bug 64323</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #89968 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323">bug 64323</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=90011" name="attach_90011" title="a different workaround">attachment 90011</a> <a href="attachment.cgi?id=90011&amp;action=edit" title="a different workaround">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=64323&amp;attachment=90011'>[review]</a>
a different workaround

OK, I played around with a lot of different options. It actually turns out that
my last patch leaks fences. And it waits on fence instead of fence_wr. The new
version fixes all these issues.

Sticking in a semaphore acquire instead helped a bit, but the rendering was
still not right. Even if I used screen-&gt;fence.current. So wait it must be :(</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385785065.5Ab35f3.19198--

--===============1031183580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1031183580==--
