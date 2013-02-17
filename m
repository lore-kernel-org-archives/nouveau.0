From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57350] [nouveau,
 linux-3.7-rc] Broken cursor and kernel log swamped with trapped
 reads/writes from BAR/PFIFO_READ/FB
Date: Sun, 17 Feb 2013 10:06:46 +0000
Message-ID: <bug-57350-8800-Tp86HBh4Xt@http.bugs.freedesktop.org/>
References: <bug-57350-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1276840536=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57350-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1276840536==
Content-Type: multipart/alternative; boundary="1361095606.E36B64.27879"; charset="us-ascii"


--1361095606.E36B64.27879
Date: Sun, 17 Feb 2013 10:06:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57350

--- Comment #22 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> ---
(In reply to comment #21)
> Created attachment 74935 [details] [review]
> compilation fix
> 
> I'm not sure why I can't hit it, but this patch will probably resolve your
> compilation problem...

The patch does not fix compilation for me.

Are you building in-tree or out-of-tree?
I'm building out-of-tree.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361095606.E36B64.27879
Date: Sun, 17 Feb 2013 10:06:46 +0000
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
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350">bug 57350</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=57350#c21">comment #21</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=74935" name="attach_74935" title="compilation fix">attachment 74935</a> <a href="attachment.cgi?id=74935&amp;action=edit" title="compilation fix">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=57350&amp;attachment=74935'>[review]</a> [review]
&gt; compilation fix
&gt; 
&gt; I'm not sure why I can't hit it, but this patch will probably resolve your
&gt; compilation problem...</span >

The patch does not fix compilation for me.

Are you building in-tree or out-of-tree?
I'm building out-of-tree.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361095606.E36B64.27879--

--===============1276840536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1276840536==--
