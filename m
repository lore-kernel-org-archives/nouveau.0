From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67315] System lockup with X consuming all CPU
Date: Mon, 29 Jul 2013 20:43:41 +0000
Message-ID: <bug-67315-8800-LW2oI3N7GH@http.bugs.freedesktop.org/>
References: <bug-67315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1874537519=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67315-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1874537519==
Content-Type: multipart/alternative; boundary="1375130621.6e25cAe1.12436"; charset="us-ascii"


--1375130621.6e25cAe1.12436
Date: Mon, 29 Jul 2013 20:43:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67315

--- Comment #12 from Rick Stevens <ricks-ijgZXeOBpMSRq8AjE7tl8g@public.gmane.org> ---
(In reply to comment #10)
> Created attachment 83220 [details] [review]
> BUG_ON(!data)
> 
> Also you can try this simple patch, it would trigger a kernel bug so be
> warned.
> If/when it does capture the output and attach it in here (either in picture
> or text form)
> Thanks

I'll need to free up some time this week to build a new kernel. I'll put it on
the "got to do" list.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375130621.6e25cAe1.12436
Date: Mon, 29 Jul 2013 20:43:41 +0000
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
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315">bug 67315</a>
              from <span class="vcard"><a class="email" href="mailto:ricks&#64;alldigital.com" title="Rick Stevens &lt;ricks&#64;alldigital.com&gt;"> <span class="fn">Rick Stevens</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67315#c10">comment #10</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=83220" name="attach_83220" title="BUG_ON(!data)">attachment 83220</a> <a href="attachment.cgi?id=83220&amp;action=edit" title="BUG_ON(!data)">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=67315&amp;attachment=83220'>[review]</a> [review]
&gt; BUG_ON(!data)
&gt; 
&gt; Also you can try this simple patch, it would trigger a kernel bug so be
&gt; warned.
&gt; If/when it does capture the output and attach it in here (either in picture
&gt; or text form)
&gt; Thanks</span >

I'll need to free up some time this week to build a new kernel. I'll put it on
the &quot;got to do&quot; list.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375130621.6e25cAe1.12436--

--===============1874537519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1874537519==--
