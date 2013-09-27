From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69488] GF108 (NVC1) GPU lockup
Date: Fri, 27 Sep 2013 15:51:49 +0000
Message-ID: <bug-69488-8800-2Efr8tvh4W@http.bugs.freedesktop.org/>
References: <bug-69488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0849204119=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69488-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0849204119==
Content-Type: multipart/alternative; boundary="1380297109.cd3a80731.725"; charset="us-ascii"


--1380297109.cd3a80731.725
Date: Fri, 27 Sep 2013 15:51:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69488

--- Comment #7 from Kevin N. <vekinn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #6)
> Created attachment 86729 [details] [review]
> better patch for sysfb_simplefb that adjusts the BOOTFB resource
> 
> sysfb_simplefb.c checks all PCI BARs on all VGA devices and adjust the
> resource to match the BAR in which the original area from screen_info is
> located.  Please test.  I'm not sure why nouveau hangs in your case.  It
> doesn't hang for me even if it shows the stack trace.

I tried with your better patch and it also works fine.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380297109.cd3a80731.725
Date: Fri, 27 Sep 2013 15:51:49 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488">bug 69488</a>
              from <span class="vcard"><a class="email" href="mailto:vekinn&#64;gmail.com" title="Kevin N. &lt;vekinn&#64;gmail.com&gt;"> <span class="fn">Kevin N.</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=69488#c6">comment #6</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=86729" name="attach_86729" title="better patch for sysfb_simplefb that adjusts the BOOTFB resource">attachment 86729</a> <a href="attachment.cgi?id=86729&amp;action=edit" title="better patch for sysfb_simplefb that adjusts the BOOTFB resource">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=69488&amp;attachment=86729'>[review]</a> [review]
&gt; better patch for sysfb_simplefb that adjusts the BOOTFB resource
&gt; 
&gt; sysfb_simplefb.c checks all PCI BARs on all VGA devices and adjust the
&gt; resource to match the BAR in which the original area from screen_info is
&gt; located.  Please test.  I'm not sure why nouveau hangs in your case.  It
&gt; doesn't hang for me even if it shows the stack trace.</span >

I tried with your better patch and it also works fine.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380297109.cd3a80731.725--

--===============0849204119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0849204119==--
