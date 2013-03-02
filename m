From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61635] glVertexAttribPointer(id, GL_UNSIGNED_BYTE,
 GL_FALSE, ...) does not work
Date: Sat, 02 Mar 2013 20:15:51 +0000
Message-ID: <bug-61635-8800-WdlCuDj3Nx@http.bugs.freedesktop.org/>
References: <bug-61635-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1013089638=="
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


--===============1013089638==
Content-Type: multipart/alternative; boundary="1362255351.2F1B2.26262"; charset="us-ascii"


--1362255351.2F1B2.26262
Date: Sat, 2 Mar 2013 20:15:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61635

--- Comment #3 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #2)
> Thank, Emil, for your quick reply!
> 
> I've just tried this patch... The good news it that it no longer corrupts
> the render, and no output to the dmesg, either. The bad news is that it
> still does not work correctly.
> 
> This is what happens with the patched applied:
> 
> I'm sending a vertex attribute array with the same byte value for all the
> vertices, and this value is used to calculate the colour of the vertex, so I
> expect it to render a solid colour. The actual output is that most vertices
> are rendered black (input 0) with just a few of them of random colours,
> changing with each frame.
> 

I was afraid of that. It looks like the original define was a bit off, although
obviously this is not the correct one either.

Someone with an actual nv4x card and better understanding of OpenGL than me
should take a look and reverse-engineer the (remaining) format(s)


> Weird...
> 
> If you think it could be useful I can try to extract the code into a small
> compilable test case...

That's always a good idea :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362255351.2F1B2.26262
Date: Sat, 2 Mar 2013 20:15:51 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61635#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - glVertexAttribPointer(id, GL_UNSIGNED_BYTE, GL_FALSE,...) does not work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61635">bug 61635</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=61635#c2">comment #2</a>)
<span class="quote">&gt; Thank, Emil, for your quick reply!
&gt; 
&gt; I've just tried this patch... The good news it that it no longer corrupts
&gt; the render, and no output to the dmesg, either. The bad news is that it
&gt; still does not work correctly.
&gt; 
&gt; This is what happens with the patched applied:
&gt; 
&gt; I'm sending a vertex attribute array with the same byte value for all the
&gt; vertices, and this value is used to calculate the colour of the vertex, so I
&gt; expect it to render a solid colour. The actual output is that most vertices
&gt; are rendered black (input 0) with just a few of them of random colours,
&gt; changing with each frame.
&gt; </span >

I was afraid of that. It looks like the original define was a bit off, although
obviously this is not the correct one either.

Someone with an actual nv4x card and better understanding of OpenGL than me
should take a look and reverse-engineer the (remaining) format(s)


<span class="quote">&gt; Weird...
&gt; 
&gt; If you think it could be useful I can try to extract the code into a small
&gt; compilable test case...</span >

That's always a good idea :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362255351.2F1B2.26262--

--===============1013089638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1013089638==--
