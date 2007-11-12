From: "Wladimir van der Laan" <laanwj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nv50 microcode/shader format
Date: Mon, 12 Nov 2007 14:27:04 +0100
Message-ID: <3a7f9e660711120527p321039cbkd494faf6df80b599@mail.gmail.com>
References: <3a7f9e660711111304j840c257vb5f12d495ddecca3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1466727009=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <3a7f9e660711111304j840c257vb5f12d495ddecca3-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1466727009==
Content-Type: multipart/alternative;
	boundary="----=_Part_17714_1527973.1194874024852"

------=_Part_17714_1527973.1194874024852
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I can answer myself here, as I finally managed to dump the shader as sent to
the card: yes, the shader binary format used for vertex, fragment and
geometry shaders on the G80 is the same as the cubin for CUDA. There appear
to be some special instructions that are used to read input and write output
registers absent from CUDA. Apart from those, decuda will be a good start if
someones decides to tackle NV50 shaders in Nouveau.

Wladimir

On Nov 11, 2007 10:04 PM, Wladimir van der Laan <laanwj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hello there,
>
> With the use of CUDA and ptx I managed to make a disassembler for at least
> one of the nv50 microcode/shader formats. This might come in handy for some
> people, hence I'm posting it here:
>
> http://www.cs.rug.nl/~wladimir/decuda/<http://www.cs.rug.nl/%7Ewladimir/decuda/>
>
> I'm not yet sure if pixel/vertex shaders use the same instruction format
> as the compute shaders used by CUDA, but you'd think so, as nv50 is supposed
> to have unified shader units. If anyone can help me a bit in finding the
> shader instructions in valgrind-mmt-extend of mmiotrace dumps that'd be a
> great help. I haven't had much luck yet with that. Is there a way to "pretty
> print" the output of those programs, I mean, fill in the registers already
> known?
>
> Greetings,
> Wladimir J. van der Laan
>
>

------=_Part_17714_1527973.1194874024852
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I can answer myself here, as I finally managed to dump the shader as sent to the card: yes, the shader binary format used for vertex, fragment and geometry shaders on the G80 is the same as the cubin for CUDA. There appear to be some special instructions that are used to read input and write output registers absent from CUDA. Apart from those, decuda will be a good start if someones decides to tackle NV50 shaders in Nouveau.
<br><br>Wladimir<br><br><div class="gmail_quote">On Nov 11, 2007 10:04 PM, Wladimir van der Laan &lt;<a href="mailto:laanwj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">laanwj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
Hello there,<br><br>With the use of CUDA and ptx I managed to make a disassembler for at least one of the nv50 microcode/shader formats. This might come in handy for some people, hence I&#39;m posting it here:<br><br><a href="http://www.cs.rug.nl/%7Ewladimir/decuda/" target="_blank">

http://www.cs.rug.nl/~wladimir/decuda/</a><br><br>I&#39;m not yet sure if pixel/vertex shaders use the same instruction format as the compute shaders used by CUDA, but you&#39;d think so, as nv50 is supposed to have unified shader units. If anyone can help me a bit in finding the shader instructions in valgrind-mmt-extend of mmiotrace dumps that&#39;d be a great help. I haven&#39;t had much luck yet with that. Is there a way to &quot;pretty print&quot; the output of those programs, I mean, fill in the registers already known?
<br><br>Greetings,<br>Wladimir J. van der Laan<br><br>
</blockquote></div><br>

------=_Part_17714_1527973.1194874024852--

--===============1466727009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1466727009==--
