From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59242] some mesa demos start to segfault after
 "nouveau: improve buffer transfers" on nv43
Date: Tue, 22 Jan 2013 06:37:31 +0000
Message-ID: <bug-59242-8800-YjgEaTe40y@http.bugs.freedesktop.org/>
References: <bug-59242-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0307293268=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59242-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0307293268==
Content-Type: multipart/alternative; boundary="1358836651.3EAEF81.15159"; charset="us-ascii"


--1358836651.3EAEF81.15159
Date: Tue, 22 Jan 2013 06:37:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59242

MASAO TAKAHASHI <masao-takahashi-D/ILkEkFJBd3+QwDJ9on6Q@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |masao-takahashi-D/ILkEkFJBd3+QwDJ9on6Q@public.gmane.org

--- Comment #1 from MASAO TAKAHASHI <masao-takahashi-D/ILkEkFJBd3+QwDJ9on6Q@public.gmane.org> ---
I have a same problem.
segfault position is the same location as this issue.

SIGSEGV is occurred in gnome-shell.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358836651.3EAEF81.15159
Date: Tue, 22 Jan 2013 06:37:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:masao-takahashi&#64;kanno.co.jp" title="MASAO TAKAHASHI &lt;masao-takahashi&#64;kanno.co.jp&gt;"> <span class="fn">MASAO TAKAHASHI</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - some mesa demos start to segfault after &quot;nouveau: improve buffer transfers&quot; on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59242">bug 59242</a>
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
           <td>masao-takahashi&#64;kanno.co.jp
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - some mesa demos start to segfault after &quot;nouveau: improve buffer transfers&quot; on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59242#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - some mesa demos start to segfault after &quot;nouveau: improve buffer transfers&quot; on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59242">bug 59242</a>
              from <span class="vcard"><a class="email" href="mailto:masao-takahashi&#64;kanno.co.jp" title="MASAO TAKAHASHI &lt;masao-takahashi&#64;kanno.co.jp&gt;"> <span class="fn">MASAO TAKAHASHI</span></a>
</span></b>
        <pre>I have a same problem.
segfault position is the same location as this issue.

SIGSEGV is occurred in gnome-shell.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358836651.3EAEF81.15159--

--===============0307293268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0307293268==--
