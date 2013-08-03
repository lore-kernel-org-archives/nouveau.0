From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67382] [nouveau,
 nv50] linux 3.9.7-3.10.3: Xorg won't be available
Date: Sat, 03 Aug 2013 01:02:49 +0000
Message-ID: <bug-67382-8800-rN1bP5plGT@http.bugs.freedesktop.org/>
References: <bug-67382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1733976494=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1733976494==
Content-Type: multipart/alternative; boundary="1375491769.FD3D83d1.25636"; charset="us-ascii"


--1375491769.FD3D83d1.25636
Date: Sat, 3 Aug 2013 01:02:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67382

--- Comment #26 from Anonymous Helper <anonymous-IjDkMZObD1hBDgjK7y7TUQ@public.gmane.org> ---
Created attachment 83558
  --> https://bugs.freedesktop.org/attachment.cgi?id=83558&action=edit
dmesg from 3.9 with offending commit + fix

(In reply to comment #25)
> Created attachment 83549 [details] [review]
> possible fix
> 
> Still not too sure how come your system senses a monitor connected to your
> second dvi port.
> 
> This patch reverts some of the new stuff introduced during the transition to
> core. Please apply this patch on top of 3.9 branch (i.e. after the offending
> commit)

Yes, this is working. It seems no ghost monitor was detected and X works like
it should :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375491769.FD3D83d1.25636
Date: Sat, 3 Aug 2013 01:02:49 +0000
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
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382">bug 67382</a>
              from <span class="vcard"><a class="email" href="mailto:anonymous&#64;dodgeit.com" title="Anonymous Helper &lt;anonymous&#64;dodgeit.com&gt;"> <span class="fn">Anonymous Helper</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=83558" name="attach_83558" title="dmesg from 3.9 with offending commit + fix">attachment 83558</a> <a href="attachment.cgi?id=83558&amp;action=edit" title="dmesg from 3.9 with offending commit + fix">[details]</a></span>
dmesg from 3.9 with offending commit + fix

(In reply to <a href="show_bug.cgi?id=67382#c25">comment #25</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=83549" name="attach_83549" title="possible fix">attachment 83549</a> <a href="attachment.cgi?id=83549&amp;action=edit" title="possible fix">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=67382&amp;attachment=83549'>[review]</a> [review]
&gt; possible fix
&gt; 
&gt; Still not too sure how come your system senses a monitor connected to your
&gt; second dvi port.
&gt; 
&gt; This patch reverts some of the new stuff introduced during the transition to
&gt; core. Please apply this patch on top of 3.9 branch (i.e. after the offending
&gt; commit)</span >

Yes, this is working. It seems no ghost monitor was detected and X works like
it should :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375491769.FD3D83d1.25636--

--===============1733976494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1733976494==--
