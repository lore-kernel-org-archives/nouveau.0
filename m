From: "Thomas Schneider" <c.monty-S0/GAf8tV78@public.gmane.org>
Subject: Re: System fails to boot w/o boot option "nomodeset"
Date: Thu, 10 Apr 2014 15:50:46 +0200
Message-ID: <trinity-7792485b-1167-4796-91f6-6f190cde4f52-1397137845881@3capp-webde-bs22>
References: <trinity-86077d40-e48f-4074-96c6-9f447a8fd650-1396971645493@3capp-webde-bs12>,
 <CAKb7Uvh3K1zYywK5Mg9PE-ZKveGHLSNPZ0ZdbH1jf=VJ-Gr73Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0811912990=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvh3K1zYywK5Mg9PE-ZKveGHLSNPZ0ZdbH1jf=VJ-Gr73Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0811912990==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>
<div>Well, with the setting/option &quot;nomodeset&quot; I don&#39;t use any xorg.conf at all.</div>

<div>&nbsp;</div>

<div>I&#39;m just not sure if the system would boot w/o xorg.conf and w/o &quot;nomodeset&quot;.</div>

<div>&nbsp;</div>

<div>Anyway, I will give it a try and use the recommended options &quot;nouveau.noaccel=1&quot; and &quot;nouveau.agpmode=0&quot; (also in combination).</div>

<div>&nbsp;</div>

<div>Question:</div>

<div>Could someone give a statement about the potential root cause?</div>

<div>Could it be true that there&#39;s no working driver for this graphic card on Linux?</div>

<div>&nbsp;</div>

<div>Regards,</div>

<div>Thomas</div>

<div>&nbsp;</div>

<div>&nbsp;</div>

<div>On Thu, Apr 10, 2014 at 4:08 AM, Thomas Schneider &lt;c.monty-S0/GAf8tV78@public.gmane.org&gt; wrote:<br/>
&gt; Hi,<br/>
&gt;<br/>
&gt; I assume I could use &quot;nouveau.noaccel=1&quot; in the command line of grub menu?</div>

<div>Yes, that&#39;s the idea.</div>

<div>&gt;<br/>
&gt; If that is true, do I need a xorg.conf file?</div>

<div>You need one as much or as little as you needed one before.</div>

<div>&gt;<br/>
&gt; With regards to your question, if the system worked before...<br/>
&gt; Yes, the system worked well with Win XP.</div>

<div>OK, good to know.</div>
-ilia

<div>&nbsp;
<div style="margin: 10.0px 5.0px 5.0px 10.0px;padding: 10.0px 0 10.0px 10.0px;border-left: 2.0px solid rgb(195,217,229);">
<div style="margin: 0 0 10.0px 0;"><b>Gesendet:</b>&nbsp;Donnerstag, 10. April 2014 um 06:24 Uhr<br/>
<b>Von:</b>&nbsp;&quot;Ilia Mirkin&quot; &lt;imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org&gt;<br/>
<b>An:</b>&nbsp;&quot;Thomas Schneider&quot; &lt;c.monty-S0/GAf8tV78@public.gmane.org&gt;<br/>
<b>Cc:</b>&nbsp;&quot;nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org&quot; &lt;nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org&gt;<br/>
<b>Betreff:</b>&nbsp;Re: [Nouveau] System fails to boot w/o boot option &quot;nomodeset&quot;</div>

<div>On Tue, Apr 8, 2014 at 11:40 AM, Thomas Schneider &lt;c.monty-S0/GAf8tV78@public.gmane.org&gt; wrote:<br/>
&gt; Hello!<br/>
&gt;<br/>
&gt; I&#39;m using rather old hardware:<br/>
&gt; Mainboard (Asus A7N8X)<br/>
&gt; AGP (Asus V7700)<br/>
&gt;<br/>
&gt; manfred@pc1:~&#36; lspci -v &#124; grep VGA<br/>
&gt; 03:00.0 VGA compatible controller: NVIDIA Corporation NV15 [GeForce2<br/>
&gt; GTS/Pro] (rev a3) (prog-if 00 [VGA controller])<br/>
&gt;<br/>
&gt; My operating system is SolydX based on Debian Testing.<br/>
&gt;<br/>
&gt; The issue is that I cannot start the system w/o boot option &quot;nomodeset&quot;.<br/>
<br/>
Using nomodeset disables nouveau entirely, so you won&#39;t be able to use<br/>
the &#39;nouveau&#39; ddx either. It&#39;d probably work with vesa or something.<br/>
<br/>
Things to try:<br/>
<br/>
nouveau.noaccel=1<br/>
nouveau.agpmode=0<br/>
<br/>
(also in combination)<br/>
<br/>
Did this system ever work? Any indication that the hardware isn&#39;t<br/>
terminally busted?<br/>
<br/>
&gt; I get this information after displaying Grub menu:<br/>
&gt;<br/>
&gt; Linux 3.11-2-486 wird geladen ...<br/>
&gt; Initiale Ramdisk wird geladen ...<br/>
&gt;<br/>
&gt; Loading, please wait ...<br/>
&gt;<br/>
&gt;<br/>
&gt; Then the system is freezing and I need to hard reset.<br/>
<br/>
If you boot without the quiet option it should make it much more<br/>
apparent where things are going wrong.<br/>
<br/>
-ilia</div>
</div>
</div>
</div></div></body></html>

--===============0811912990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0811912990==--
