From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68835] [NV04] Script offset calculated incorrectly
 for some BMP 1.x VBIOSes
Date: Mon, 27 Jan 2014 07:52:11 +0000
Message-ID: <bug-68835-8800-GygPW0nRiS@http.bugs.freedesktop.org/>
References: <bug-68835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0931378352=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0931378352==
Content-Type: multipart/alternative; boundary="1390809131.7D4BE1.3105"; charset="us-ascii"


--1390809131.7D4BE1.3105
Date: Mon, 27 Jan 2014 07:52:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68835

--- Comment #14 from Mauro Molinari <mauromol-IWqWACnzNjyonA0d6jMUrA@public.gmane.org> ---
(In reply to comment #13)
> Great! You could also have grabbed a pre-compiled 3.13 kernel off of
> rawhide, if that's availble. I'm really not sure what the Fedora situation
> is though, so I can't give specific advice.

Hmmm... I will seek for further information, however applying the patch to 3.12
was easy, it's just so slow to compile. I left the PC running over night and
this morning it's still there... It's building all the flavors of the kernel,
so I should better try to just make one flavor next time, but I'm not sure
about what to choose (the above page talks about xen, smp, up, pae, kdump,
debug and debuginfo... and I'm not sure what would be the best in my case).

> I believe you have a different bug already open about this, yes?

Not yet. I already talked about it in a comment in bug #68854, but you didn't
give me an ok to open a new bug! :-) Should I?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390809131.7D4BE1.3105
Date: Mon, 27 Jan 2014 07:52:11 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV04] Script offset calculated incorrectly for some BMP 1.x VBIOSes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68835#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV04] Script offset calculated incorrectly for some BMP 1.x VBIOSes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68835">bug 68835</a>
              from <span class="vcard"><a class="email" href="mailto:mauromol&#64;tiscali.it" title="Mauro Molinari &lt;mauromol&#64;tiscali.it&gt;"> <span class="fn">Mauro Molinari</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=68835#c13">comment #13</a>)
<span class="quote">&gt; Great! You could also have grabbed a pre-compiled 3.13 kernel off of
&gt; rawhide, if that's availble. I'm really not sure what the Fedora situation
&gt; is though, so I can't give specific advice.</span >

Hmmm... I will seek for further information, however applying the patch to 3.12
was easy, it's just so slow to compile. I left the PC running over night and
this morning it's still there... It's building all the flavors of the kernel,
so I should better try to just make one flavor next time, but I'm not sure
about what to choose (the above page talks about xen, smp, up, pae, kdump,
debug and debuginfo... and I'm not sure what would be the best in my case).

<span class="quote">&gt; I believe you have a different bug already open about this, yes?</span >

Not yet. I already talked about it in a comment in <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV04] PROTECTION_ERROR / PROTECTION_FAULT"
   href="show_bug.cgi?id=68854">bug #68854</a>, but you didn't
give me an ok to open a new bug! :-) Should I?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390809131.7D4BE1.3105--

--===============0931378352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0931378352==--
