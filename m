From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59057] Black screen after resume from s2ram
Date: Mon, 07 Jan 2013 19:58:43 +0000
Message-ID: <bug-59057-8800-jG6rfV9x9A@http.bugs.freedesktop.org/>
References: <bug-59057-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2008226863=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59057-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2008226863==
Content-Type: multipart/alternative; boundary="1357588723.Ed22D21.6063"; charset="us-ascii"


--1357588723.Ed22D21.6063
Date: Mon, 7 Jan 2013 19:58:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59057

--- Comment #16 from Pontus Fuchs <pontus.fuchs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #15)
> Created attachment 72603 [details] [review]
> possible fix
> 
> Does it make a difference?

I tried this patch on top of 3.8rc2 and 3.8rc2+"drm/nv50/disp: fix resume from
s2ram for analog output" but no improvement :(

I use only the laptop's panel. I have no external monitor.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357588723.Ed22D21.6063
Date: Mon, 7 Jan 2013 19:58:43 +0000
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
   title="NEW --- - Black screen after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59057#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Black screen after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59057">bug 59057</a>
              from <span class="vcard"><a class="email" href="mailto:pontus.fuchs&#64;gmail.com" title="Pontus Fuchs &lt;pontus.fuchs&#64;gmail.com&gt;"> <span class="fn">Pontus Fuchs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=59057#c15">comment #15</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=72603" name="attach_72603" title="possible fix">attachment 72603</a> <a href="attachment.cgi?id=72603&amp;action=edit" title="possible fix">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=59057&amp;attachment=72603'>[review]</a> [review]
&gt; possible fix
&gt; 
&gt; Does it make a difference?</span >

I tried this patch on top of 3.8rc2 and 3.8rc2+&quot;drm/nv50/disp: fix resume from
s2ram for analog output&quot; but no improvement :(

I use only the laptop's panel. I have no external monitor.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357588723.Ed22D21.6063--

--===============2008226863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2008226863==--
