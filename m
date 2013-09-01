From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39550] [NV96] Brightness stuck to low value after
 suspend/resume on HP Elitebook 8530w
Date: Sun, 01 Sep 2013 12:28:25 +0000
Message-ID: <bug-39550-8800-h7NCRv35oe@http.bugs.freedesktop.org/>
References: <bug-39550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0359540322=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39550-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0359540322==
Content-Type: multipart/alternative; boundary="1378038506.DFf3488.25678"; charset="us-ascii"


--1378038506.DFf3488.25678
Date: Sun, 1 Sep 2013 12:28:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=39550

--- Comment #44 from Roy <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org> ---
(In reply to comment #36)
> Created attachment 68764 [details] [review]
> Enable the PANEL_BACKLIGHT_LEVEL GPIO
> 
> Guys can you try the patch. It should apply against the latest nouveau tree

NACK on this patch: this particular pin should be driven by a PWM in SOR, as
indicated in 0xe100. Rather look if routing from PWM to GPIO pin is correct...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378038506.DFf3488.25678
Date: Sun, 1 Sep 2013 12:28:26 +0000
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
   title="NEW --- - [NV96] Brightness stuck to low value after suspend/resume on HP Elitebook 8530w"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39550#c44">Comment # 44</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] Brightness stuck to low value after suspend/resume on HP Elitebook 8530w"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39550">bug 39550</a>
              from <span class="vcard"><a class="email" href="mailto:r.spliet&#64;student.tudelft.nl" title="Roy &lt;r.spliet&#64;student.tudelft.nl&gt;"> <span class="fn">Roy</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=39550#c36">comment #36</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=68764" name="attach_68764" title="Enable the PANEL_BACKLIGHT_LEVEL GPIO">attachment 68764</a> <a href="attachment.cgi?id=68764&amp;action=edit" title="Enable the PANEL_BACKLIGHT_LEVEL GPIO">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=39550&amp;attachment=68764'>[review]</a> [review]
&gt; Enable the PANEL_BACKLIGHT_LEVEL GPIO
&gt; 
&gt; Guys can you try the patch. It should apply against the latest nouveau tree</span >

NACK on this patch: this particular pin should be driven by a PWM in SOR, as
indicated in 0xe100. Rather look if routing from PWM to GPIO pin is correct...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378038506.DFf3488.25678--

--===============0359540322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0359540322==--
