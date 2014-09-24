From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Wed, 24 Sep 2014 17:13:55 +0000
Message-ID: <bug-27501-8800-ie4gDHgJOn@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1129791961=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1129791961==
Content-Type: multipart/alternative; boundary="1411578835.efb182b6.7611"; charset="us-ascii"


--1411578835.efb182b6.7611
Date: Wed, 24 Sep 2014 17:13:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #35 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #34)
> Created attachment 106803 [details] [review]
> Option for disabling acceleration for given chipset
> 
> Rather than completely disabling the discrete card, disabling the
> acceleration on that card also works. Use nouveau.chipsetnoaccel=0x96 in
> this case to disable acceleration on the 9600M GT.

How about changing noaccel instead to optionally be able to take a list of pci
addresses? (Or even just one to start...) I think that would have a much higher
chance of being accepted upstream.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1411578835.efb182b6.7611
Date: Wed, 24 Sep 2014 17:13:55 +0000
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
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c35">Comment # 35</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=27501#c34">comment #34</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=106803" name="attach_106803" title="Option for disabling acceleration for given chipset">attachment 106803</a> <a href="attachment.cgi?id=106803&amp;action=edit" title="Option for disabling acceleration for given chipset">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=27501&amp;attachment=106803'>[review]</a> [review]
&gt; Option for disabling acceleration for given chipset
&gt; 
&gt; Rather than completely disabling the discrete card, disabling the
&gt; acceleration on that card also works. Use nouveau.chipsetnoaccel=0x96 in
&gt; this case to disable acceleration on the 9600M GT.</span >

How about changing noaccel instead to optionally be able to take a list of pci
addresses? (Or even just one to start...) I think that would have a much higher
chance of being accepted upstream.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411578835.efb182b6.7611--

--===============1129791961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1129791961==--
