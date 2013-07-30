From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67382] [nouveau,
 nv50] linux 3.9.7-3.10.3: Xorg won't be available
Date: Tue, 30 Jul 2013 18:06:16 +0000
Message-ID: <bug-67382-8800-JKvq5sTAzi@http.bugs.freedesktop.org/>
References: <bug-67382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1245621571=="
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


--===============1245621571==
Content-Type: multipart/alternative; boundary="1375207576.71fc2.30608"; charset="us-ascii"


--1375207576.71fc2.30608
Date: Tue, 30 Jul 2013 18:06:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67382

--- Comment #14 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #13)
> Created attachment 83307 [details]
> dmesg from 3.9 with the faulty commit and debug2 (aka 3.9.7+debug2)
> 
> There you go. dmesg output with debug2 kernel.
> 
Thanks, there is something really funky happening in here. 

> >I have a sneaky suspicion that you may need to try a 3.7 kernel, but that will >follow after the results from this patch
> 
> Huh? Something special about 3.7, or what is the reason?
The commit that causes the issue on your setup fixes a regression introduced
around the 3.7

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375207576.71fc2.30608
Date: Tue, 30 Jul 2013 18:06:16 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382">bug 67382</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67382#c13">comment #13</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=83307" name="attach_83307" title="dmesg from 3.9 with the faulty commit and debug2 (aka 3.9.7+debug2)">attachment 83307</a> <a href="attachment.cgi?id=83307&amp;action=edit" title="dmesg from 3.9 with the faulty commit and debug2 (aka 3.9.7+debug2)">[details]</a></span>
&gt; dmesg from 3.9 with the faulty commit and debug2 (aka 3.9.7+debug2)
&gt; 
&gt; There you go. dmesg output with debug2 kernel.
&gt; </span >
Thanks, there is something really funky happening in here. 

<span class="quote">&gt; &gt;I have a sneaky suspicion that you may need to try a 3.7 kernel, but that will &gt;follow after the results from this patch
&gt; 
&gt; Huh? Something special about 3.7, or what is the reason?</span >
The commit that causes the issue on your setup fixes a regression introduced
around the 3.7</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375207576.71fc2.30608--

--===============1245621571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1245621571==--
