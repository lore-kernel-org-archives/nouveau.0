From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61635] glVertexAttribPointer(id, GL_UNSIGNED_BYTE,
 GL_FALSE, ...) does not work
Date: Fri, 01 Mar 2013 20:27:08 +0000
Message-ID: <bug-61635-8800-CoQ1B96Dr0@http.bugs.freedesktop.org/>
References: <bug-61635-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0205492946=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61635-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0205492946==
Content-Type: multipart/alternative; boundary="1362169628.Cf7FD1.19129"; charset="us-ascii"


--1362169628.Cf7FD1.19129
Date: Fri, 1 Mar 2013 20:27:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61635

--- Comment #2 from rodrigo <rodrigorivascosta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Thank, Emil, for your quick reply!

I've just tried this patch... The good news it that it no longer corrupts the
render, and no output to the dmesg, either. The bad news is that it still does
not work correctly.

This is what happens with the patched applied:

I'm sending a vertex attribute array with the same byte value for all the
vertices, and this value is used to calculate the color of the vertex, so I
expect it to render a solid color. The actual output is that most vertices are
rendered black (input 0) with just a few of them of random colors, changing
with each frame.

Weird...

If you think it could be useful I can try to extract the code into a small
compilable test case...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362169628.Cf7FD1.19129
Date: Fri, 1 Mar 2013 20:27:08 +0000
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
   title="NEW --- - glVertexAttribPointer(id, GL_UNSIGNED_BYTE, GL_FALSE,...) does not work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61635#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - glVertexAttribPointer(id, GL_UNSIGNED_BYTE, GL_FALSE,...) does not work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61635">bug 61635</a>
              from <span class="vcard"><a class="email" href="mailto:rodrigorivascosta&#64;gmail.com" title="rodrigo &lt;rodrigorivascosta&#64;gmail.com&gt;"> <span class="fn">rodrigo</span></a>
</span></b>
        <pre>Thank, Emil, for your quick reply!

I've just tried this patch... The good news it that it no longer corrupts the
render, and no output to the dmesg, either. The bad news is that it still does
not work correctly.

This is what happens with the patched applied:

I'm sending a vertex attribute array with the same byte value for all the
vertices, and this value is used to calculate the color of the vertex, so I
expect it to render a solid color. The actual output is that most vertices are
rendered black (input 0) with just a few of them of random colors, changing
with each frame.

Weird...

If you think it could be useful I can try to extract the code into a small
compilable test case...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362169628.Cf7FD1.19129--

--===============0205492946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0205492946==--
