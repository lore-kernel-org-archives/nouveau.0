From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78116] Auto fan speed management doesn't do anything
 in non critical temperature range (NVC0)
Date: Sat, 24 May 2014 04:41:02 +0000
Message-ID: <bug-78116-8800-pwnudPRD91@http.bugs.freedesktop.org/>
References: <bug-78116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1988060769=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78116-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1988060769==
Content-Type: multipart/alternative; boundary="1400906462.8DFA4F822.30299"; charset="us-ascii"


--1400906462.8DFA4F822.30299
Date: Sat, 24 May 2014 04:41:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78116

--- Comment #14 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #13)
> Seems that my old card - GTX 260 doesn't support manual mode nor does it
> report any temperature/fan speed. 
> 
> [    0.491166] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
> [    0.491175] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
> [    0.491179] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes

It doesn't surprise me. However, it should find an external temperature sensor
and fan management chip (the ADT7473), can you confirm that or paste your logs
here?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1400906462.8DFA4F822.30299
Date: Sat, 24 May 2014 04:41:02 +0000
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
   title="NEW --- - Auto fan speed management doesn't do anything in non critical temperature range (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78116#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Auto fan speed management doesn't do anything in non critical temperature range (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78116">bug 78116</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=78116#c13">comment #13</a>)
<span class="quote">&gt; Seems that my old card - GTX 260 doesn't support manual mode nor does it
&gt; report any temperature/fan speed. 
&gt; 
&gt; [    0.491166] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
&gt; [    0.491175] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
&gt; [    0.491179] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes</span >

It doesn't surprise me. However, it should find an external temperature sensor
and fan management chip (the ADT7473), can you confirm that or paste your logs
here?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1400906462.8DFA4F822.30299--

--===============1988060769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1988060769==--
