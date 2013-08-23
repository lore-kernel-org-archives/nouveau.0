From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67382] [nouveau,
 nv50] linux 3.9.7-3.10.3: Xorg won't be available
Date: Fri, 23 Aug 2013 17:16:59 +0000
Message-ID: <bug-67382-8800-fMMgDRuI8H@http.bugs.freedesktop.org/>
References: <bug-67382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0413102885=="
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


--===============0413102885==
Content-Type: multipart/alternative; boundary="1377278219.E52e1.20805"; charset="us-ascii"


--1377278219.E52e1.20805
Date: Fri, 23 Aug 2013 17:16:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67382

--- Comment #35 from Anonymous Helper <anonymous-IjDkMZObD1hBDgjK7y7TUQ@public.gmane.org> ---
(In reply to comment #33)
> Created attachment 84479 [details] [review]
> nv50 quirk
> 
> Confirmed that only nv50 are affected. The blob's dac handling does differ 
> between nv50 and later cards, so this patch should do the job.

Quite a difference in handling, if I look at #34

> Feel free to test and provide a full name + email if you'd like your
> contributions to me acknowledged ("Reported-by" and "Tested-by")

Tested it and it's working :) Thanks for all the work.
And naming me isn't necessary. I'm happy, that the problem is fixed.

But I'm wondering if more such cases will appear.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377278219.E52e1.20805
Date: Fri, 23 Aug 2013 17:16:59 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382#c35">Comment # 35</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382">bug 67382</a>
              from <span class="vcard"><a class="email" href="mailto:anonymous&#64;dodgeit.com" title="Anonymous Helper &lt;anonymous&#64;dodgeit.com&gt;"> <span class="fn">Anonymous Helper</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67382#c33">comment #33</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=84479" name="attach_84479" title="nv50 quirk">attachment 84479</a> <a href="attachment.cgi?id=84479&amp;action=edit" title="nv50 quirk">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=67382&amp;attachment=84479'>[review]</a> [review]
&gt; nv50 quirk
&gt; 
&gt; Confirmed that only nv50 are affected. The blob's dac handling does differ 
&gt; between nv50 and later cards, so this patch should do the job.</span >

Quite a difference in handling, if I look at #34

<span class="quote">&gt; Feel free to test and provide a full name + email if you'd like your
&gt; contributions to me acknowledged (&quot;Reported-by&quot; and &quot;Tested-by&quot;)</span >

Tested it and it's working :) Thanks for all the work.
And naming me isn't necessary. I'm happy, that the problem is fixed.

But I'm wondering if more such cases will appear.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377278219.E52e1.20805--

--===============0413102885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0413102885==--
