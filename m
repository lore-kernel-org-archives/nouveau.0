From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91171] Space Rangers 2 (in Wine) shows only black
	screen
Date: Sat, 04 Jul 2015 19:36:18 +0000
Message-ID: <bug-91171-8800-nCLny1RehG@http.bugs.freedesktop.org/>
References: <bug-91171-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0870473506=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91171-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0870473506==
Content-Type: multipart/alternative; boundary="1436038578.766EE651.17291"; charset="UTF-8"


--1436038578.766EE651.17291
Date: Sat, 4 Jul 2015 19:36:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91171

Henri Verbeet <hverbeet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hverbeet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #3 from Henri Verbeet <hverbeet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Single buffering is pretty much expected for ddraw applications. You should be
seeing framebuffer blits followed by a glFlush() instead of a glXSwapBuffers()
call. I can't rule out that this is a bug in Wine, although the fact that it
works with the proprietary driver and mostly works with software rendering
seems to suggest it probably isn't.

One thing that's a bit nasty about ddraw applications in general is that they
often end up with multiple (independent) GL contexts, not sure if that's the
case here or not.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436038578.766EE651.17291
Date: Sat, 4 Jul 2015 19:36:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:hverbeet&#64;gmail.com" title="Henri Verbeet &lt;hverbeet&#64;gmail.com&gt;"> <span class="fn">Henri Verbeet</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Space Rangers 2 (in Wine) shows only black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91171">bug 91171</a>
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
           <td>hverbeet&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Space Rangers 2 (in Wine) shows only black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91171#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Space Rangers 2 (in Wine) shows only black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91171">bug 91171</a>
              from <span class="vcard"><a class="email" href="mailto:hverbeet&#64;gmail.com" title="Henri Verbeet &lt;hverbeet&#64;gmail.com&gt;"> <span class="fn">Henri Verbeet</span></a>
</span></b>
        <pre>Single buffering is pretty much expected for ddraw applications. You should be
seeing framebuffer blits followed by a glFlush() instead of a glXSwapBuffers()
call. I can't rule out that this is a bug in Wine, although the fact that it
works with the proprietary driver and mostly works with software rendering
seems to suggest it probably isn't.

One thing that's a bit nasty about ddraw applications in general is that they
often end up with multiple (independent) GL contexts, not sure if that's the
case here or not.</pre>
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

--1436038578.766EE651.17291--

--===============0870473506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0870473506==--
