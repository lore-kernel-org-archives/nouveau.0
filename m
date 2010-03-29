From: Corbin Simpson <mostawesomedude-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Mesa3d-dev] Status of s3tc patent in respect to open-source
	drivers and workarounds
Date: Sun, 28 Mar 2010 17:07:21 -0700
Message-ID: <e7bd23c31003281707v4d8107a8ka4330ce69ba5b322@mail.gmail.com>
References: <4BAF41C0.5010201@warriorhut.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <radeonhd+bounces-9527-gcfxdr-radeonhd=m.gmane.org-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Post: <mailto:radeonhd-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:radeonhd+help-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Subscribe: <mailto:radeonhd+subscribe-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <mailto:radeonhd+unsubscribe-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Owner: <mailto:radeonhd+owner-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Archive: <http://lists.opensuse.org/radeonhd/>
In-Reply-To: <4BAF41C0.5010201-nc9XehmSRdrhF+sknpXCvw@public.gmane.org>
To: SpliFF <spliff-nc9XehmSRdrhF+sknpXCvw@public.gmane.org>
Cc: mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, information-juUERV/Fi2c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, radeonhd-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Mar 28, 2010 at 4:47 AM, SpliFF <spliff-nc9XehmSRdrhF+sknpXCvw@public.gmane.org> wrote:
> Hi radeonhd, nouveau, mesa3d developers,
>
> Firstly, thank you all very much for all the important work you do.
>
> I've been working as a part-time developer on the "Spring RTS" project
> (open-source game engine) which runs on linux (and other os). Some time
> ago I tried the engine on the open-source ATI radeonhd driver, which I
> understand to be partly based on mesa 3d, and all textures were white. I
> originally assumed it was an engine bug but after some investigation
> tracked it down to s3tc texture (de)compression not being integrated in
> the open driver for legal reasons. It seems the same issue applies to
> Mesa3d and Nouveau - that is s3tc being patented and the patent owner
> refusing to comment or provide cover for open-source projects
> implementing the techniques discussed in US Patent 5956431
> (http://v3.espacenet.com/publicationDetails/claims?DB=&locale=&FT=D&date=19990921&CC=US&NR=5956431A&KC=A&tree=true)
>
> I recently took inspiration from an article/talk presented by Andrew
> Trigell regarding patents where he claims developers often overestimate
> the scope of patents
> (http://news.swpat.org/2010/03/transcript-tridgell-patents/) because
> they fixate on the title and summary instead of the actual claims.
>
> The key point he was making is that in order to infringe a patent you
> apparently have to infringe on ALL ELEMENTS of a PRIMARY claim. If you
> don't do something in the primary claim then by definition you aren't
> doing the things in secondary claims that reference it (ie, where the
> claim reads "... in claim X ..."). In short if you workaround the
> primary claims you probably aren't infringing. Wikipeadia, with some
> jurisdictional hand-waving, appears to agree: "If all of the claim's
> elements are found in the technology, the claim is said to "read on" the
> technology; if a single element from the claim is missing from the
> technology, the claim does not literally read on the technology and the
> technology does not infringe the patent with respect to that claim."
>
> So I took a look at the 4 primary claims that apply to DECODING s3tc
> textures. All other claims either rely on these claims or involve
> encoding, which Mesa 3D / Xorg drivers should not need to do. Finding a
> workaround for these primary claims is necessary to avoid infringement
> for an s3tc decoder. I'll break these into seperate elements because a
> workaround (non-infringement) for ANY element is a workaround for the
> ENTIRE claim itself. The elements are seperated by semicolons and I've
> added line-breaks to make them clearer).
>
> To avoid confusion I've removed the preamble from each claim, they don't
> count as elements of the claim.
>
> In short, if anyone on these lists can see a way to decompress an s3tc
> image without doing just 1 of the items from EACH of the following 4
> claims then a legal s3tc decoder should be possible.
>
> ================
> 5.
> an encoded image decomposer,
> coupled to receive encoded image data file having at least one
> compressed image block,
> for breaking the encoded image data file into individual compressed
> image blocks,
> each compressed image block having at least one associated codeword,
> each codeword generated through selecting a block type for an original
> image block comprising the compressed image block,
> computing an analog curve for the block type,
> selecting a partition along the analog curve for the computed analog curve,
> and computing the set of codewords for the partition;
>
> at least one block decoder,
> coupled to the encoded image decomposer,
> for decompressing the compressed image blocks;
>
> and an image composer,
> coupled to each block decoder,
> for ordering the decompressed image blocks in an output file.
>
> ==================
> 16.
> receiving the encoded image data;
>
> decomposing the encoded image into the modified header and the
> individual encoded image blocks;
>
> reading the modified header to generate an output header;
>
> decoding each individual encoded image block to generate a decoded image
> block,
> including receiving each individual encoded image block, including a
> plurality of codewords,
> and a bitmap of at least one pixel,
> the plurality of codewords derived through selecting a block type for an
> original image block of the encoded image block,
> computing an analog curve for the block type,
> selecting a partition along the analog curve for the computed analog curve,
> and computing the plurality of codewords for the partition;
>
> and composing the output header and the individual decoded image blocks
> to generate an output file of the original image.
>
> ==================
> 21.
> a block address computation module, coupled to receive each codeword
> from the header information, for computing an address of an encoded
> image block having the identified pixel;
>
> a block fetching module, coupled to receive the encoded image block
> portion and the computed address, for fetching the encoded image block
> having the identified pixel;
>
> and a block decoder, coupled to receive the fetched encoded image block,
> for decoding the image block to generate a quantized color associated
> with the identified pixel.
>
> ==================
> 22.
> computing an address for an encoded image block having the identified
> pixel,
> the address computed from the at least one codeword for the encoded
> image block;
>
> fetching the encoded image block using the computed address;
>
> computing quantized color levels for the fetched encoded image block;
>
> and selecting a color of the identified pixel from the quantized color
> levels to output.
>
> ===================
>
>
> One thing that stands out to me are that none of the primary claims seem
> to describe the technical format itself (ie, no algorithms, keywords,
> block sizes, byte-alignment, etc..) This means the claims at issue seem
> to be *methods* of data handling, (and not particularly inventive ones
> in my opinion). That suggests to me that with a little thought it should
> be possible to generate the same results via a method that doesn't
> infringe one of the 4 specific claims listed above. To clarify, despite
> all the technical mumbling in the abstract the claimed invention does
> not appear to be a "format" as such, but a method of pulling "blocks"
> and a "header" out of an undefined format and generating "color pixels".
> Even the abstract claims all the presented examples of keywords, values
> and structure for s3tc are not the actual invention being claimed.
> Another important point is that some of the wording in the claims may
> not mean what it appears to mean (ie, the generally accepted
> definition), the full patent may redefine some common software terms in
> the wrapper.
>
> Some possible avenues of investigation, straight off the top of my head are:
>
> * Determine the patents' definition of a "unit" and/or "module", and use
> something else (ie, a monolithic function)
> * Determine the patents' definition of a "block", and use something
> else. (characters, a bytestream, ...)
> * Determine the patents' definition of "compose / decompose", and do
> something else.
> * Do we need to "compose a header" as a seperate stage (use a footer,
> temporary vars, registers)
> * Does the curve have to be "analog"? What about a lookup table with
> discreet points that approximate a curve?
> * Can the algorithms work on groups of blocks or sub-blocks instead of
> "individual blocks".
>
> More for DRI projects than Mesa, but I'll ask anyway:
> * Do we need to decode anything; could an X11 driver force-feed the raw
> bytes to hardware instead?
>
> Claim 22 seems like a pretty important step and possibly a hard one to
> workaround but it also appears to be claiming the invention of using a
> key lookup to fetch values with some vague notion of quantising them. Is
> it just me or are they claiming to have invented indexed color?
>
> PS. If some of the points above seem pedantic that's deliberate. My
> understanding is that patent claims are actually intended or required to
> be NARROW in scope as broad claims are usually rejected. That means a
> workaround that doesn't do PRECISELY the things in each claim above is,
> by definition, a new invention. I'm hoping an invention that members of
> this community are capable of finding before someone else patents it.
>
> I've CC'ed the EFF on this because I'd like to see it become a part of
> their patent-busting efforts. Fear of this patent is blocking an
> extremely important component of 3D gaming under linux (the use of DDS
> textures under an open-source driver). Not that I'm a fan of DDS, just
> that it's the format of choice for commercial and non-commercial games
> until hardware supports something better, and even then still a
> requirement for running many classic games under WINE +
> radeonhd/mesa3d/nouveau. It seems absurd that I can buy a product with a
> patent license granted (NVIDIA/ATI card) but then be denied the
> protection of that license because I don't use part of the product (the
> official driver). I really hope that as a community we can either invent
> around this patent or bust it (at least in US / EU where it is most
> problematic) without losing hardware support or requiring the
> reformatting/conversion of digital assets.\

Since neither you nor Andrew are lawyers, I would kindly ask that you
refrain from attempting to provide legal advice. :3

The scant legal advice that *has* been obtained suggests that the
current course of action, wherein S3TC is not advertised without the
aid of an external library or a configuration option force-enabling
it, is the best course of action. I for one would prefer to have
firsthand legal advice before making any changes, although I am not a
lawyer and cannot provide legal advice.

At any rate, since Spring is open-source, I would heavily advise the
Spring team to remember that OpenGL extensions that are not part of a
core version are not guaranteed to be available, and in this case,
there is a trivial workaround for when the extension is not present,
so you guys could (and should!) include an uncompressed texture path
and ship uncompressed textures.

~ C.

-- 
When the facts change, I change my mind. What do you do, sir? ~ Keynes

Corbin Simpson
<MostAwesomeDude-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
-- 
To unsubscribe, e-mail: radeonhd+unsubscribe-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org
For additional commands, e-mail: radeonhd+help-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org
