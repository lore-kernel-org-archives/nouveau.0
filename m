From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83079] [NVC0] Dota 2 (Linux native and Wine) crash
 with Nouveau Drivers
Date: Fri, 29 Aug 2014 01:48:40 +0000
Message-ID: <bug-83079-8800-tY87swSvGT@http.bugs.freedesktop.org/>
References: <bug-83079-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0011119913=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83079-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0011119913==
Content-Type: multipart/alternative; boundary="1409276922.DC42cC1.24507"; charset="us-ascii"


--1409276922.DC42cC1.24507
Date: Fri, 29 Aug 2014 01:48:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83079

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #12)
> Created attachment 105398 [details]
> The Crashing shader
> 
> Ok, got the shader!
> 
> nouveau_compiler does not talk much sadly:
> 
> ~/> ...
> Compiling for NVC0
> ~/>

Parsing fails in nouveau_compiler... need to increase the size of the tokens
array. However when compiling for NVE4 (and Luke has a Kepler), it goes into an
infinite loop, which is consistent with a hang. Investigating...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409276922.DC42cC1.24507
Date: Fri, 29 Aug 2014 01:48:42 +0000
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
   title="NEW --- - [NVC0] Dota 2 (Linux native and Wine) crash with Nouveau Drivers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83079#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC0] Dota 2 (Linux native and Wine) crash with Nouveau Drivers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83079">bug 83079</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=83079#c12">comment #12</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=105398" name="attach_105398" title="The Crashing shader">attachment 105398</a> <a href="attachment.cgi?id=105398&amp;action=edit" title="The Crashing shader">[details]</a></span>
&gt; The Crashing shader
&gt; 
&gt; Ok, got the shader!
&gt; 
&gt; nouveau_compiler does not talk much sadly:
&gt; 
&gt; ~/&gt; ...
&gt; Compiling for NVC0
&gt; ~/&gt;</span >

Parsing fails in nouveau_compiler... need to increase the size of the tokens
array. However when compiling for NVE4 (and Luke has a Kepler), it goes into an
infinite loop, which is consistent with a hang. Investigating...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409276922.DC42cC1.24507--

--===============0011119913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0011119913==--
