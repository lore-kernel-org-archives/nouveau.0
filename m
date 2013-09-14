From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50375] [NV1A] KMS/fbcon accel failing after
 scrolling/tty switch
Date: Sat, 14 Sep 2013 14:48:12 +0000
Message-ID: <bug-50375-8800-3kkHOzTec2@http.bugs.freedesktop.org/>
References: <bug-50375-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0390389400=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50375-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0390389400==
Content-Type: multipart/alternative; boundary="1379170092.5C4d6f62.11100"; charset="us-ascii"


--1379170092.5C4d6f62.11100
Date: Sat, 14 Sep 2013 14:48:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50375

--- Comment #9 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> ---
(In reply to comment #8)
> Created attachment 85215 [details] [review]
> fix nv1a chipset checks
> 
> can you test with the two patches i just uploaded instead?

These two patches get the output reaching monitor as well as the previous
patch.


Note: with nouveau loaded (3.11-rc7, previous patch applied) I had memory
(SLAB) corruption as if someone did reuse stale pointers or write beyond
allocated memory. I have no idea on the responsible party though they don't
seem to happen with VGA console (nouveau not loaded).

The scrolling bug seems fixed though.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379170092.5C4d6f62.11100
Date: Sat, 14 Sep 2013 14:48:12 +0000
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
   title="NEW --- - [NV1A] KMS/fbcon accel failing after scrolling/tty switch"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50375#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV1A] KMS/fbcon accel failing after scrolling/tty switch"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50375">bug 50375</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=50375#c8">comment #8</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=85215" name="attach_85215" title="fix nv1a chipset checks">attachment 85215</a> <a href="attachment.cgi?id=85215&amp;action=edit" title="fix nv1a chipset checks">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=50375&amp;attachment=85215'>[review]</a> [review]
&gt; fix nv1a chipset checks
&gt; 
&gt; can you test with the two patches i just uploaded instead?</span >

These two patches get the output reaching monitor as well as the previous
patch.


Note: with nouveau loaded (3.11-rc7, previous patch applied) I had memory
(SLAB) corruption as if someone did reuse stale pointers or write beyond
allocated memory. I have no idea on the responsible party though they don't
seem to happen with VGA console (nouveau not loaded).

The scrolling bug seems fixed though.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379170092.5C4d6f62.11100--

--===============0390389400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0390389400==--
