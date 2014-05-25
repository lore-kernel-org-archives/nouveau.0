From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79204] [NV50] No reported temperature/fan speed on
	GTX260
Date: Sun, 25 May 2014 18:13:52 +0000
Message-ID: <bug-79204-8800-Z8EnTwooom@http.bugs.freedesktop.org/>
References: <bug-79204-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0705159455=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79204-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0705159455==
Content-Type: multipart/alternative; boundary="1401041632.fb057882.1026"; charset="us-ascii"


--1401041632.fb057882.1026
Date: Sun, 25 May 2014 18:13:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79204

--- Comment #5 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #4)
> Created attachment 99785 [details]
> sensors (after patch)
> 
> Seems that it's reporting accurate values. The temperature seems right and
> does change, it has single fan which is adjustable and correctly responds to
> pwm1 changes after switching to manual mode.

Great, I'll send the patch to the ML! Thanks for testing!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401041632.fb057882.1026
Date: Sun, 25 May 2014 18:13:52 +0000
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
   title="NEW --- - [NV50] No reported temperature/fan speed on GTX260"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79204#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50] No reported temperature/fan speed on GTX260"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79204">bug 79204</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=79204#c4">comment #4</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=99785" name="attach_99785" title="sensors (after patch)">attachment 99785</a> <a href="attachment.cgi?id=99785&amp;action=edit" title="sensors (after patch)">[details]</a></span>
&gt; sensors (after patch)
&gt; 
&gt; Seems that it's reporting accurate values. The temperature seems right and
&gt; does change, it has single fan which is adjustable and correctly responds to
&gt; pwm1 changes after switching to manual mode.</span >

Great, I'll send the patch to the ML! Thanks for testing!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401041632.fb057882.1026--

--===============0705159455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0705159455==--
